---
uid: sdsTableFormat
---

# Table format

Results of a query can be organized into tables by directing the form parameter to return a table. Two forms of table are available: table and header table. Apply the table format to any read that returns multiple values and summaries by setting the form variable to specify a table or a table with headers.

When the form parameter is specified as `table`, `?form=table`, events are returned in row column form. Results include a collection named Columns that lists column name and type and a collection named Rows containing a collection of rows matching the order of the columns.

Specifying a form of type `table-headers`, `?form=tableh`, results in a collection where the Rows collection contains a column header list.

The following is a request to retrieve values using the window parameters:

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/Simple/Data
   ?startIndex=2017-04-01T07:00:00Z&endIndex=2017-04-01T07:10:00Z
 ```

The following is an example of a response for the code above:

```json
Content-Type: application/json

[
   {  
      "Time":"2017-04-01T07:00:00Z",
      "State":1
   },
   {  
      "Time":"2017-04-01T07:01:00Z",
      "State":1,
      "Measurement":1.0
   },
   {  
      "Time":"2017-04-01T07:02:00Z",
      "State":1,
      "Measurement":2.0
   },
   {  
      "Time":"2017-04-01T07:03:00Z",
      "State":1,
      "Measurement":3.0
   },
   {
      "Time":"2017-04-01T07:04:00Z",
      "State":1,
      "Measurement":4.0
   },
   {  
      "Time":"2017-04-01T07:05:00Z",
      "State":1,
      "Measurement":5.0
   },
   {  
      "Time":"2017-04-01T07:06:00Z",
      "State":1,
      "Measurement":6.0
   },
   {  
      "Time":"2017-04-01T07:07:00Z",
      "State":1,
      "Measurement":7.0
   },
   {  
      "Time":"2017-04-01T07:08:00Z",
      "State":1,
      "Measurement":8.0
   },
   {  
      "Time":"2017-04-01T07:09:00Z",
      "State":1,
      "Measurement":9.0
   }
]
```

* To retrieve the results in table format, add the form variable and specify `table`.

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/Simple/Data
   ?startIndex=2017-04-01T07:00:00Z&endIndex=2017-04-01T07:10:00Z
   &form=table
 ```

Response

```json
Content-Type: application/json

{  
   "Name":"Simple",
   "Columns":[  
      {  
         "Name":"Time",
         "Type":"DateTime"
      },
      {  
         "Name":"State",
         "Type":"Int32Enum"
      },
      {  
         "Name":"Measurement",
         "Type":"Double"
      }
   ],
   "Rows":[  
      [  
         "2017-04-01T07:00:00Z",
         1,
         0.0
      ],
      [  
         "2017-04-01T07:01:00Z",
         1,
         1.0
      ],
      [  
         "2017-04-01T07:02:00Z",
         1,
         2.0
      ],
      [  
         "2017-04-01T07:03:00Z",
         1,
         3.0
      ],
      [  
         "2017-04-01T07:04:00Z",
         1,
         4.0
      ],
      [  
         "2017-04-01T07:05:00Z",
         1,
         5.0
      ],
      [  
         "2017-04-01T07:06:00Z",
         1,
         6.0
      ],
      [  
         "2017-04-01T07:07:00Z",
         1,
         7.0
      ],
      [  
         "2017-04-01T07:08:00Z",
         1,
         8.0
      ],
      [  
         "2017-04-01T07:09:00Z",
         1,
         9.0
      ]
   ]
}
```

* To retrieve the results in table format with column headers, add the form variable and specify `tableh`.

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/Simple/Data
   ?startIndex=2017-04-01T07:00:00Z&endIndex=2017-04-01T07:10:00Z
   &form=tableh
 ```

Response

```json
Content-Type: application/json

{  
   "Name":"Simple",
   "Columns":[  
      {  
         "Name":"Time",
         "Type":"DateTime"
      },
      {  
         "Name":"State",
         "Type":"Int32Enum"
      },
      {  
         "Name":"Measurement",
         "Type":"Double"
      }
   ],
   "Rows":[  
      [  
         "Time",
         "State",
         "Measurement"
      ],
      [  
         "2017-04-01T07:00:00Z",
         1,
         0.0
      ],
      [  
         "2017-04-01T07:01:00Z",
         1,
         1.0
      ],
      [  
         "2017-04-01T07:02:00Z",
         1,
         2.0
      ],
      [  
         "2017-04-01T07:03:00Z",
         1,
         3.0
      ],
      [  
         "2017-04-01T07:04:00Z",
         1,
         4.0
      ],
      [  
         "2017-04-01T07:05:00Z",
         1,
         5.0
      ],
      [  
         "2017-04-01T07:06:00Z",
         1,
         6.0
      ],
      [  
         "2017-04-01T07:07:00Z",
         1,
         7.0
      ],
      [  
         "2017-04-01T07:08:00Z",
         1,
         8.0
      ],
      [  
         "2017-04-01T07:09:00Z",
         1,
         9.0
      ]
   ]
}
```
