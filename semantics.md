# Semantics and Usage

The terminology described above is the manifestation of intended semantics of NDN and CCN operations (what do we expect the network to do?). In this section we summarize the most commonly proposed use cases and interpretations.

## Data Transfer

The networking view of NDN and CCN is that the request/reply protocol implements a basic, unreliable data transfer service for single, named packets.

## Data Transport

Data transfer can be turned into a data transport service for application-level objects by additional logic. This transport logic must understand and construct the series of names needed to reassemble the segmented object. Various flavors of transport can be envisaged (reliable, streaming, mailbox, etc)

## Lookup Service

A more distributed systems view of the basic request/reply protocol is that NDN and CCN provide a distributed lookup service: Given a key value (=name), the service will return the corresponding value.

## Database Access

The lookup service turns into a database access protocol by ... namespace design ... prefix standing for a collection ... The DB query expression must be encoded as a name.

## Remote Procedure Call

More generally, ... parameters in the interest ... used e.g.,/ as command channel for remote control of neighbor routers.

**Interest match in FIB (longest prefix match)**:

> A process of finding a FIB entry with the longest name (in terms of name components) that is a prefix of the specified name.

**Interest match in PIT (exact match)**:

> A process of finding a PIT entry that stores the same as specified interest (including interest restrictions, if any).

**Data match in PIT (all match)**:

> a process of finding (a set of) PIT entries that can be satisfied with the specified data packet.

**Interest match in CS (any match)**:

> a process of finding an entry in router’s content store that can satisfy the specified interest.

