# Semantics and Usage

The terminology described above is the manifestation of intended semantics of NDN and CCNx operations (what do we expect the network to do?). In this section we summarize the most commonly proposed use cases and interpretations.

## Data Transfer

The networking view of NDN and CCNx is that the request/reply protocol implements a basic, unreliable data transfer service for single, named packets.

## Data Transport

Data transfer can be turned into a data transport service for application-level objects by additional logic. This transport logic must understand and construct the series of names needed to reassemble the segmented object. Various flavors of transport can be envisaged (reliable, streaming, mailbox, etc).

## Lookup Service

In a more distributed systems view of the basic request/reply protocol, NDN and CCNx provide a distributed lookup service: given a key value (=name), the service will return the corresponding value.

## Database Access

A lookup service can be turned into into a database access protocol by using the namespace structure to specify names as access keys into a database. A name prefix therefore stands for a collection or table of a database, while the rest of the name specifies the query expression to be executed.

## Remote Procedure Call

The names as defined here for Interests and Data can refer to Remote Procedure call functions, their input arguments, and their results.


**Interest match in FIB (longest prefix match)**:

> A process of finding a FIB entry with the longest Name (in terms of Name components) that is a prefix of the specified Name.

**Interest match in PIT (exact match)**:

> A process of finding a PIT entry that stores the same Name as specified in the Interest (including Interest restrictions, if any).

**Data match in PIT (all match)**:

> A process of finding (a set of) PIT entries that can be satisfied with the specified Data packet.

**Interest match in CS (any match)**:

> A process of finding an entry in router’s Content Store that can satisfy the specified Interest.

