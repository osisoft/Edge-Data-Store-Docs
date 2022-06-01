---
uid: sdsStreamViews
---

# Stream views

Stream views provide flexibility in the use of SdsTypes. While you cannot actually change the properties of SdsTypes themselves, use the stream views feature to create a view of a selected SdsStream that appears as if you had changed the SdsType on which it is based. Create a stream view by choosing a source and target type. Then, create a set of mappings between properties of those two types. Using a stream view to leverage existing SdsType properties is preferable to creating a new SdsType because the SdsStream that is based on the SdsType continues to function with its previously archived stream data intact.

See the impact of the stream view on a stream either in an ad hoc manner through a `GET` method or by assigning the stream view to a stream with a `PUT` method.

An SdsStreamView provides a way to map stream data requests from one data type to another. You can apply a stream view to any read or `GET` operation. SdsStreamView is used to specify the mapping between source and target types.

## Stream view fields and properties

The following table shows the SdsStreamView fields. Fields that are not included are reserved for internal SDS use. For more information on search limitations, see [Search in SDS](xref:sdsSearching).

| Property     | Type                   | Optionality | Searchable | Details |
|--------------|------------------------|-------------|------------|---------|
| `Id`           | String                 | Required    | Yes        |Identifier for referencing the stream view |
| `Name`         | String                 | Optional    | Yes        |Friendly name |
| `Description` | String                 | Optional    | Yes        |Description text |
| `SourceTypeId` | String                 | Required    | Yes        |Identifier of the SdsType of the SdsStream |
| `TargetTypeId` | String                 | Required    | Yes        |Identifier of the SdsType to convert events to |
| `Properties`   | IList\<SdsStreamViewProperty\> | Optional    | Yes, with limitations  |Property level mapping |

**Note:**  SdsStreamViewProperty objects are not searchable. Only the SdsStreamViewProperty's SdsStreamView is searchable by its `Id`, `SourceTypeId`, and `TargetTypeId`. These are used to return the top level SdsStreamView object when searching. The same is true for nested SdsStreamViewProperties.

### Rules for the stream view identifier (SdsStreamView.Id)

The type identifier, `SdsStreamView.ID`, has the following requirements:

- Is not case sensitive

- Can contain spaces

- Cannot contain forward slash ("/")

- Contains a maximum of 100 characters

## SdsStreamView mapping

SDS attempts to map properties from the source to the destination. When the mapping is straightforward, SDS automatically maps properties from the source to the target type. For example:
 
 - The properties are in the same position
 
 - The properties are of the same data type
 
 - The properties have the same name

When SDS is unable to determine how to map a source property, the property is removed. If SDS encounters a target property that it cannot map to, the property is added and configured with a default value. To map a property that SDS cannot map automatically, define an `SdsStreamViewProperty` and add it to the SdsStreamView’s properties.

The following table show mapping compatibilities. SDS largely supports mapping within the same data type. 

| Source type\ Target type    | Numeric types 	| Nullable numeric types 	| Enumeration types 	| Nullable enumeration types 	| Object types    	| 
|----------------------------	|---------------	|------------------------	|-------------------	|----------------------------	|--------------------|
| Numeric types              	| Yes           	| Yes                    	| No                	| No                         	| No                 |
| Nullable numeric types     	| Yes           	| Yes                    	| No                	| No                         	| No                 |
| Enumeration types          	| No            	| No                     	| Yes               	| Yes                        	| No                 |
| Nullable enumeration types 	| No            	| No                     	| Yes               	| Yes                        	| No                 | 
| Object types               	| No            	| No                     	| No                	| No                         	| Yes*               |

\* Mappable if `typeId` matches between the source and the target type

## `SdsStreamViewProperty`

The SdsStreamView properties collection provides detailed instructions for mapping of event properties. Each `SdsStreamViewProperty` in the properties collection defines the mapping of an event’s property. `SdsStreamView` properties are required only when property mapping is not straightforward. Additionally, if you do not want a type property mapped, it is not necessary to create an `SdsStreamView` property for it.

The following table shows the required and optional `SdsStreamViewProperty` fields.

| Property | Type    | Optionality | Details |
|----------|---------|-------------|---------|
| `SourceId` | String  | Required    | Identifier of the `SdsTypeProperty` from the source SdsType Properties list |
| `TargetId` | String  | Required    | Identifier of the `SdsTypeProperty` from the target SdsType Properties list |
| `SdsStreamView`  | SdsStreamView | Optional    | Additional mapping instructions for derived types. Supports nested properties |

## `SdsStreamViewMap`

When an SdsStreamView is added, SDS defines a plan mapping and stores it as an `SdsStreamViewMap`. The `SdsStreamViewMap` provides a detailed property-by-property definition of the mapping.

The following table shows the `SdsStreamViewMap` fields. The `SdsStreamViewMap` cannot be written to SDS, it can only be retrieved from SDS, so required and optional have no meaning.

| Property     | Type                     | Optionality  | Details |
|--------------|--------------------------|--------------|---------|
| `SourceTypeId` | String                   | Required     | Identifier of the SdsType of the SdsStream |
| `TargetTypeId` | String                   | Required     | Identifier of the SdsType to convert events to |
| `Properties`   | IList\<SdsStreamViewMapProperty\>| Optional     | Property level mapping |

### Properties / `SdsStreamViewMapProperty`

The `SdsStreamViewMapProperty` is similar an `SdsStreamViewProperty` but adds a mode detailing one or more actions taken on the property.

The following table shows the `SdsStreamViewMapProperty` fields. The `SdsStreamViewMap` cannot be written to SDS; it can only be retrieved from SDS, so required and optional have no meaning.

| Property     | Type        | Details |
|--------------|-------------|---------|
| `SourceTypeId` | String      | Identifier of the SdsType of the SdsStream |
| `TargetTypeId` | String      | Identifier of the SdsType to convert events to |
| `Mode`         | SdsStreamViewMode | Aggregate of actions applied to the properties. `SdsStreamViewModes` are combined via binary arithmetic. |
| `SdsStreamViewMap`   | SdsStreamViewMap  | Mapping for derived types |

The available `SdsStreamViewModes` are shown in the following table.

| Name                   | Value  | Description |
|------------------------|--------|-------------|
| None                   | 0x0000 | No action   |
| FieldAdd               | 0x0001 | Add a property matching the specified SdsTypeProperty |
| FieldRemove            | 0x0002 | Remove the property matching the specified SdsTypeProperty |
| FieldRename            | 0x0004 | Rename the property matching the source SdsTypeProperty to the target SdsTypeProperty |
| FieldMove              | 0x0008 | Move the property from the location in the source to the location in the target |
| FieldConversion        | 0x0016 | Converts the source property to the target type |
| InvalidFieldConversion | 0x0032 | Cannot perform the specified mapping |

## Changing stream type

Stream views can be used to change the type defining a stream. You cannot modify the SdsType; types are immutable. But you can map a stream from its current type to a new type.

To update a stream's type, define an `SdsStreamView` and `PUT` the stream view to the following:

```text
PUT api/v1/Tenants/default/Namespaces/{namespaceId}/Streams/{streamId}/Type?streamViewId={streamViewId}
```

For details, see [Update Stream Type](xref:sdsStreamsAPI#update-stream-type).
