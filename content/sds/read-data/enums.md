---
uid: Enums
---

# Enums

Enums, or enumerated types, are variable types that have a limited set of possible values. The SDS read APIs support the following enums:

 - `SdsBoundaryType`

 - `SdsSearchMode`

## SdsBoundaryType

The `SdsBoundaryType` enum defines how data on the boundary of queries is handled: around the start index for range value queries, and around the start and end index for window values. The following table describes valid `SdsBoundaryType` values.

| Boundary | Enumeration value | Operation |
| -------  | ----------------- | --------- |
| Exact    | 0                 | Results include the event at the specified index boundary if a stored event exists at that index. |
| Inside   | 1                 | Results include only events within the index boundaries. |
| Outside  | 2                 | Results include up to one event that falls immediately outside of the specified index boundary. |
| ExactOrCalculated | 3        | Results include the event at the specified index boundary. If no stored event exists at that index, one is calculated based on the index type and interpolation and extrapolation settings. |

## SdsSearchMode

The `SdsSearchMode` enum defines search behavior when seeking a stored event near a specified index. The following table describes valid values for `SdsSearchMode`.

| Mode  | Enumeration value | Operation |
| ----- | ----------------- | --------- |
| Exact | 0                 | If a stored event exists at the specified index, that event is returned. Otherwise, no event is returned. |
| ExactOrNext | 1           | If a stored event exists at the specified index, that event is returned. Otherwise, the next event in the stream is returned. |
| Next | 2                  | Returns the stored event after the specified index. |
| ExactOrPrevious | 3       | If a stored event exists at the specified index, that event is returned. Otherwise, the previous event in the stream is returned. |
| Previous | 4              | Returns the stored event before the specified index. |
