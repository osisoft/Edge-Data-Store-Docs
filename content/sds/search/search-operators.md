---
uid: SearchOperators
---

# Search operators

Specify search operators in the `query` string to return more specific search results.

Operators | Description
----------|-------------------------------------------------------------------
`AND` | AND operator. For example, `cat AND dog` searches for streams containing both "cat" and "dog".  AND must be in all caps.
`OR`  | OR operator. For example, `cat OR dog` searches for streams containing either "cat" or "dog" or both.  OR must be in all caps.
`NOT` | NOT operator. For example, `cat NOT dog` searches for streams that have the "cat" term or do not have "dog".  NOT must be in all caps.
`*`   | Wildcard operator. For example, `cat*` searches for streams that have a term that starts with "cat", ignoring case.
`:`   | Field-scoped query.  For example, `id:stream*` will search for streams where the `id` field starts with "stream", but will not search on other fields like `name` or `description`.  <br> **Note:** Field names are camel case and are case sensitive.
`( )` | Precedence operator. For example, `motel AND (wifi OR luxury)` searches for streams containing motel and either wifi or luxury (or both).

**Note:** You can use the wildcard `*` only once for each search term, except for the case of a Contains type query clause. In that case, two wildcards are allowed: one as prefix and one as suffix; for example, `*Tank*` is valid, but `*Ta*nk`, `Ta*nk*`, and `*Ta*nk*` are not supported. The wildcard `*` only works when specifying a single search term. For example, you can search for `Tank*`, `*Tank`, `Ta*nk` but not `Tank Meter*`.

## : Operator

Set the fields to search using the following syntax:

```text
fieldname:fieldvalue
```

**Request**
The following example shows the `':'` operator.

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query=name:pump name:pressure
```

## \* Operator

Use the `'*'` character as a wildcard to specify an incomplete string.
**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
`log*` | log<br>logger | analog
`*log` | analog<br>alog | logg
`*log*` | analog<br>alogger | lop
`l*g` | log<br>logg | lop

  **Supported**     | **Not Supported**
------------------ | ----------------------------------------
`*`<br>`*log`<br>`l*g`<br>`log*`<br>`*log*`	| `*l*g*`<br>`*l*g`<br>`l*g*`

**Request**
The following example shows the `'*'` operator.

```text
GET api/v1/Tenants/default/Namespaces/{namespaceId}/Streams?query=log*
```

## Other operator examples

**Query string**     | **Matches field value** | **Does not match field value**
------------------ | --------------------------------- | -----------------------------
`mud AND log` | log mud<br>mud log | mud<br>log
`mud OR log` | log mud<br>mud<br>log |
`mud AND (NOT log)` | mud | mud log
`mud AND (log OR pump*)` | mud log<br>mud pumps | mud bath
`name:stream* AND (description:pressure OR description:pump)` | The name starts with "stream" and the description includes either term "pressure" or term "pump" |
