---
uid: analyticsQuickStart
---

ANGELA PRODUCTION

# Edge Data Store analytics quick start

This topic provides a quick start for a very simple analytic that can written using the Edge Data Store. The intended input device for this example is a Modbus TCP or other sensor that outputs 4 boolean values. The normal range of operation is that the values are neither all true or all false. If all values are true, the exception condition High is triggered. If all values are false, the exception condition Low is triggered. Any other combination of boolean values is Normal. Three analytic streams are created to track these changes. The ValueRangeHigh stream is 1 when High and 0 when anything else. The ValueRangeLow stream is -1 when Low and 0 when anything else. The ValueRangeOut stream is -1 when Low, 0 when Normal, and 1 when High.

 The following example assumes the Edge Data Store was installed with the default port (5590):

```csharp
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Text;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;

namespace ExceptionReportingSample
{
    class ModbusField
    {
        public string StreamId { get; set; }
        public int ScanRate { get; set; }
    }

    enum Alert
    {
        Normal,
        High,
        Low
    }
    class ExceptionReporting
    {
        static HttpClient _client = new HttpClient();
        private static List<string> StreamIds = new List<string>(new string[] { "SwitchState1", "SwitchState2", "SwitchState3", "SwitchState4" });
        private const string ValueRangeHigh = "ValueRangeHigh";
        private const string ValueRangeLow = "ValueRangeLow";
        private const string ValueRangeOut = "ValueRangeOut";
        private const string TypeId = "ValueRange";
        private const string ModbusComponentId = "Modbus1";
        private const double lowValue = -1.0;
        private const double highValue = 1.0;
        private const double normalValue = 0.0;
        public static Alert _alert = Alert.Normal;

        static TimeSpan GetPollingIntervalFromModbus(string modbusComponentId, List<string> StreamIds)
        {
            int pollingMilliseconds = 5000;
            string endpoint = $"http://localhost:5590/api/v1/configuration/{modbusComponentId}/DataSelection";
            string modbusConfig = _client.GetStringAsync(endpoint).Result;
            List<ModbusField> values = JsonConvert.DeserializeObject<List<ModbusField>>(modbusConfig);
            foreach (var value in values)
            {
                foreach (string StreamId in StreamIds)
                {
                    if (StreamId == value.StreamId && value.ScanRate < pollingMilliseconds)
                    {
                        pollingMilliseconds = value.ScanRate;
                    }
                }
            }
            return TimeSpan.FromMilliseconds(pollingMilliseconds);
        }

        static bool GetStreamValue(string StreamId)
        {
            bool value = false;
            string lastValueUri = string.Format("http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/{0}/Data/Last", StreamId);
            string lastValueJson = _client.GetStringAsync(lastValueUri).Result;
            Dictionary<string, object> values = JsonConvert.DeserializeObject<Dictionary<string, object>>(lastValueJson);
            object objValue = values["Value"];
            if (objValue is Boolean) value = (bool)objValue;
            return value;
        }

        static bool FindOrCreateType(string typeId)
        {
            string typeUri = string.Format("http://localhost:5590/api/v1/tenants/default/namespaces/default/types/{0}", typeId);
            HttpResponseMessage response = _client.GetAsync(typeUri).Result;
            if (response.IsSuccessStatusCode) return true;
            string typeJson = @"{""Id"": """ + typeId + @""",""Name"": """ + typeId + @""",""SdsTypeCode"": 1,""Properties"": [{""Id"": ""Time"",""Name"": ""Time"",""IsKey"": true,""SdsType"": {""SdsTypeCode"": 16}},{""Id"": ""Measurement"",""Name"": ""Measurement"",""SdsType"": {""SdsTypeCode"": 14}}]}";
            var content = new StringContent(typeJson, Encoding.UTF8, "application/json");
            response = _client.PostAsync(typeUri, content).Result;
            return response.IsSuccessStatusCode;
        }

        static bool FindOrCreateStream(string streamId, string typeId)
        {
            string streamUri = string.Format("http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/{0}/", streamId);
            HttpResponseMessage response = _client.GetAsync(streamUri).Result;
            if (response.IsSuccessStatusCode) return true;
            string streamJson = @"{""Id"": """ + streamId + @""",""Name"": """ + streamId + @""",""TypeId"": """ + typeId + @"""}";
            var content = new StringContent(streamJson, Encoding.UTF8, "application/json");
            response = _client.PostAsync(streamUri, content).Result;
            return response.IsSuccessStatusCode;
        }

        static bool WriteStreamValue(string StreamId, double value, DateTime timestamp)
        {
            string dataUri = string.Format("http://localhost:5590/api/v1/tenants/default/namespaces/default/streams/{0}/Data", StreamId);
            string dataJson = @"[{""Time"": """ + timestamp.ToString("o") + @""",""Measurement"":" + value.ToString() + "}]";
            var content = new StringContent(dataJson, Encoding.UTF8, "application/json");
            HttpResponseMessage response = _client.PostAsync(dataUri, content).Result;
            return response.IsSuccessStatusCode;
        }

        static Alert CheckStatus(int numberTrue)
        {
            if (numberTrue > 3) return Alert.High;
            if (numberTrue < 1) return Alert.Low;
            return Alert.Normal;
        }

        static bool ReportChange(Alert oldAlert, Alert newAlert)
        {
            bool success = true;
            DateTime now = DateTime.UtcNow;
            switch (oldAlert)
            {
                case Alert.Normal:
                    if (Alert.Low == newAlert)
                    {
                        return WriteStreamValue(ValueRangeLow, lowValue, now)
                            && WriteStreamValue(ValueRangeOut, lowValue, now);
                    }
                    if (Alert.High == newAlert)
                    {
                        return WriteStreamValue(ValueRangeHigh, highValue, now)
                            && WriteStreamValue(ValueRangeOut, highValue, now);
                    }
                    break;

                case Alert.High:
                    if (Alert.Low == newAlert)
                    {
                        return WriteStreamValue(ValueRangeLow, lowValue, now)
                            && WriteStreamValue(ValueRangeOut, lowValue, now)
                            && WriteStreamValue(ValueRangeHigh, normalValue, now);
                    }
                    if (Alert.Normal == newAlert)
                    {
                        return WriteStreamValue(ValueRangeOut, normalValue, now)
                            && WriteStreamValue(ValueRangeHigh, normalValue, now);
                    }
                    break;

                case Alert.Low:
                    if (Alert.Normal == newAlert)
                    {
                        return WriteStreamValue(ValueRangeOut, normalValue, now)
                            && WriteStreamValue(ValueRangeLow, normalValue, now);
                    }
                    if (Alert.High == newAlert)
                    {
                        return WriteStreamValue(ValueRangeLow, normalValue, now)
                            && WriteStreamValue(ValueRangeOut, highValue, now)
                            && WriteStreamValue(ValueRangeHigh, highValue, now);
                    }
                    break;

                default:
                    break;
            }

            return success;
        }

        static void Main(string[] args)
        {
            TimeSpan pollingInterval = GetPollingIntervalFromModbus(ModbusComponentId, StreamIds);
            FindOrCreateType(TypeId);
            FindOrCreateStream(ValueRangeHigh, TypeId);
            FindOrCreateStream(ValueRangeLow, TypeId);
            FindOrCreateStream(ValueRangeOut, TypeId);
            while (true)
            {
                int numberTrue = 0;
                foreach (string StreamId in StreamIds)
                {
                    bool value = GetStreamValue(StreamId);
                    if (value) numberTrue++;
                }
                Alert currentAlert = CheckStatus(numberTrue);
                if (currentAlert != _alert)
                {
                    if (ReportChange(_alert, currentAlert))
                    {
                        _alert = currentAlert;
                    }
                }
                System.Threading.Thread.Sleep(pollingInterval);
                Console.WriteLine("ValueRange should be " + _alert);
            }
        }
    }
}
```
