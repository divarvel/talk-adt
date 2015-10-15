% Algebraic Data Types for fun and profit
% Clément Delafargue
% 2015-10-16

# I'm online!

 - [\@clementd](https://twitter.com/clementd) on twitter
 - [cltdl.fr/blog](http://cltdl.fr/blog)
 - [clever cloud](http://clever-cloud.com)


--------------------------------------------------------------------------------

<div class="yolo" style="background-color:#54CC14">

### Algebraic Data Types for fun and profit

</div>

--------------------------------------------------------------------------------

<div class="yolo" style="background-color:#CC4A14">

## Algebraic

</div>

--------------------------------------------------------------------------------

<div class="yolo" style="background-color: #99583D">

## Data

</div>

--------------------------------------------------------------------------------

<div class="yolo" style="background-color: #FF0000">

## Type

</div>

--------------------------------------------------------------------------------

```java
class DnsRecord {
    String recordType;
    String domainName;
    String cnameAlias;
    IpAddr recordIp;
    int ttl;
}
```

--------------------------------------------------------------------------------

```java
if(record.recordType.equals("CNAME")) {
    // should not be null
    record.cnameAlias;
} else if(record.recordType.equals("A")) {
    // should not be null
    record.recordIp;
} else {
    // ???
}
```

--------------------------------------------------------------------------------

## Implicit subset of fields

--------------------------------------------------------------------------------

## No Exhaustivity check

--------------------------------------------------------------------------------

```java
switch() {
  //...
  case default:
    throw new RuntimeException(
      "This should not happen lol"
    );
}
```
--------------------------------------------------------------------------------

![](./assets/whatever.jpg)

--------------------------------------------------------------------------------

## Sum and Products

--------------------------------------------------------------------------------

## Product type

--------------------------------------------------------------------------------

## Tuple?

--------------------------------------------------------------------------------

## Record?

--------------------------------------------------------------------------------

## Oh, right.

--------------------------------------------------------------------------------

<div class="yolo" style="background-color:#99583D">

## POJO

</div>

--------------------------------------------------------------------------------

## `a * b`

--------------------------------------------------------------------------------

## `(Bool * Bool)`

--------------------------------------------------------------------------------

<div class="yolo" style="background-color:#CC4A14">

## `2 * 2 = 4`

</div>

--------------------------------------------------------------------------------

## Sum type

--------------------------------------------------------------------------------

## Enum

--------------------------------------------------------------------------------

# `Pending | Accepted | Rejected`

--------------------------------------------------------------------------------

# Sum type

--------------------------------------------------------------------------------

## `Status + Bool`

--------------------------------------------------------------------------------

<div class="yolo" style="background-color:#CC4A14">

## `3 + 2 = 5`

</div>

--------------------------------------------------------------------------------

## Sum type

--------------------------------------------------------------------------------

      CnameRecord ( ttl, name, alias )
    | ARecord     ( ttl, name, ipv4 address )
    | AaaaRecord  ( ttl, name, ipv6 address )
    | TxtRecord   ( ttl, name, value )

--------------------------------------------------------------------------------

## Let's factor it out

--------------------------------------------------------------------------------

    DnsRecord( ttl, name,
        AValue(ipv4)
      | AaaaValue(ipv6)
      | CnameValue(alias)
      | TxtValue(name)

--------------------------------------------------------------------------------

## Distributivity

--------------------------------------------------------------------------------

<p style="text-align: center; margin-top: 200px;">
`(a * b + a * c)`<br>
`<=>`<br>
`a * (b + c)`
</p>

--------------------------------------------------------------------------------

## Commutativity

--------------------------------------------------------------------------------

<p style="text-align: center; margin-top: 200px;">
`(a * b) <=> (b * a)`<br>
`(a + b) <=> (b + a)`
</p>

--------------------------------------------------------------------------------

## Identities

--------------------------------------------------------------------------------

## Associativity

--------------------------------------------------------------------------------

# Haskell

```haskell

data DnsRecord =
    CnameRecord Int String String
  | ARecord Int String IpV4
  | AaaaRecord Int String IpV6
  | TxtRecord Int String String
```

--------------------------------------------------------------------------------

# Scala

```scala
sealed trait DnsRecord
case class CnameRecord(...)
  extends DnsRecord
case class ARecord(...)
  extends DnsRecord
case class AaaaRecord(...)
  extends DnsRecord
case class TxtRecord(...)
  extends DnsRecord
```

--------------------------------------------------------------------------------

# Javascript

```javascript
var adt = require('adt');
var DnsRecord = adt.data({
  CnameRecord: { ttl: adt.only(Number), ... },
  ARecord: { ttl: adt.only(Number), ... }
});
```
