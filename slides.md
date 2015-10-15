# Type de données algébriques

# Type

# de Données

# Algébrique

--------------------------------------------------------------------------------

    class DnsRecord {
        String recordType;
        String domainName;
        String cnameAlias;
        IpAddr recordIp;
        int ttl;
    }

--------------------------------------------------------------------------------

    if(record.recordType.equals("CNAME")) {
        record.cnameAlias; // should not be null
    } else if(record.recordType.equals("A")) {
        record.recordIp; // should not be null
    } else {
        // ???
    }

# Implicit subset of fields

# Exhaustivity check

# Sum and Products

# Product type

    a * b
    (Bool * Bool) // 2 * 2 = 4

# Sum type

# Enum

    Pending | Accepted | Rejected

# Sum type

    Status + Bool // 3 + 2 = 5

# Sum type

      CnameRecord ( ttl, name, alias )
    | ARecord     ( ttl, name, ipv4 address )
    | AaaaRecord  ( ttl, name, ipv6 address )
    | TxtRecord   ( ttl, name, value )

# Algebraic data type

    DnsRecord( ttl, name,
        AValue(ipv4)
      | AaaaValue(ipv6)
      | CnameValue(alias)
      | TxtValue(name)

# Distributivity

    (a * b + a * c) <=> a * (b + c)

# Commutativity

    (a * b) <=> (b * a)
    (a + b) <=> (b + a)

# Identities

    a * 1 <=> a
    a + 0 <=> a

# Unit type

    ()

# Void type

    Void

# Associativity

    (a + b) + c <=> a + (b + c)
    (a * b) * c <=> a * (b * c)

# Functions

    A -> B
    b ^ a
