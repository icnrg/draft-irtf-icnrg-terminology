# Terms by category

# Generic terms

**Information-Centric Networking (ICN)**:

> A networking architecture that retrieves Data packets as response to Interest packets.  Content-Centric Networking (CCNx 1.x) and Named Data Networking (NDN) are two realizations (designs) of the ICN architecture.

**Data packet**:

> A network-level packet that carries payload, uniquely identified by a name, and is directly secured.

  >> Common aliases include: data, data object, content object, content object packet, data message, named data object, named data.

**Interest packet**:

> A network-level packet that expresses the request for a data packet using either an exact name or a name prefix. An interest packet may optionally carry a set of additional restrictions (e.g., interest selectors). An interest may be associated with additional information to facilitate forwarding and can include Interest lifetime, hop limit, forwarding hints, labels, etc. In different ICN designs, the set of additional associated information may vary.

  >> Common aliases include: interest, interest message, information request

<!--<t>Location-independence (?)</t>[LZ: I’d suggest to move all location/identifier related stuff into one place, which is not here]-->

**Data packet immutability**:

> After a data packet is created, it cannot change.  If the content carried in the data packet is mutable, versioning should be used, so that each version uniquely identifies an immutable instance of the content. This allows disambiguation of coordination in distributed systems.

## Terms related to Name Types

**Name**:

> A Data packet identifier. An ICN name is hierarchical (a sequence of name components) and usually is semantically meaningful, making it expressive, flexible and application-specific (akin to a HTTP URL). A Name may encode information about application context, semantics, locations (topological, geographical, hyperbolic, etc.), a service name, etc.

  >> Common aliases include: data name, interest name, content name.

**Exact name**:

> A name that is encoded inside a Data packet and which typically uniquely identifies this Data packet.

**Name component**:

> a sequence of octets and optionally a numeric type representing a single label in the hierarchical structured name.

  >> Common aliases include: name segment (as in CCN).

**Packet ID**:

> a unique cryptographic identifier for a Data packet.  Typically, this is a cryptographic hash digest of a data packet (such as SHA256), including its name, payload, meta information, and signature.

**Full Name**:

> An exact Name with the Packet ID of the corresponding Data packet.

**Prefix Name**:

> A name that includes a partial sequence of name components (starting from the first one) of a name encoded inside a Data packet.

  >> Common aliases include: prefix.

**Selector**:

> A mechanism (condition) to select an individual Data packet from a collection of Data packets that match a given Interest that requests data using prefix or exact name.
> <!-- AA: I commented out these, as this seem to be giving architectural description, not generic definition of the term -->
> <!-- Depending on the implementation, some restrictors can show up as name components or as explicit fields of an interest. -->
> <!-- Selectors are not 'names' in a proper sense although they are able to "name content." -->
> <!-- Examples include selectors used to reference nameless objects, specify publisher restriction, etc. -->
> <!-- In that sense, a single data packet will have multiple 'name-like properties' through which it can be referenced, interest packets are able to express them. -->

  >> Common aliases include: interest selector, restrictor, interest restrictor.

<!-- caw: this is misplaced a nonce has nothing to do with names -->
**Nonce**:

> A field of an Interest packet that transiently 'names' an interest instance (instance of Interest for a given name).

<!-- Naming scalability (?)  [LZ: probably a confusion with routing scalability] -->

## Terms related to Name Usage

**Naming conventions**:

> a convention, agreement, or specification for the Data packet naming.  Naming convention structures a namespace.

  >> Common aliases include: Naming scheme, ICN naming scheme, namespace convention

<!-- AA: Do we really need to define these two naming schemes, given the current document focuses on NDN and CCNx -->

**Hierarchically structured naming**:

> The naming scheme that assigns and interprets name as a sequence of labels (name components) with hierarchical structure. A structure provides useful context information for the name.

  >> Common aliases include: hierarchical naming, structured naming.

<!-- Name or parts of it can be “human-readable” to ease human interaction, but a hierarchical name is ultimately a sequence of ICN node interpretable name components. -->

**Flat naming**:

> The naming scheme that assigns and interprets name as a single label (name component) without any internal structure. This can be considered a special (or degenerated) case of structured names.

<!-- Information Identifiers (?): Location prefix (?): [LZ: I commented these out, to minimize confusions-->

**Segmentation**:

> A process of splitting large application content into a set of uniquely named data packets.  When using hierarchically structured name, each created data packet has a common prefix and additional component representing the segment (chunk) number.

  >> Common aliases include: chunking

**Versioning**:

> A process of assigning a unique name to the revision of the content carried in the data packet.  When using a hierarchically structured name, the version of the data packet can be carried in a dedicated name component (e.g., prefix identifies data, unique version component identifies the revision of the data).

  <!-- What would be the difference when putting the version before the segment number? Is
  one then versioning individual segments instead of application layer content? -->

**Fragmentation**:

> A process of splitting data packets into frames so that they can be transmitted over the link with a smaller MTU size.

## Terms related to Packet Types

<!-- AA: I think this section is problematic.  Both Link (this term is really ambiguous) and Manifest are application-level things and not architectural components -->

**Link**:

> A type of Data packet whose body contains the Name of another Data packet. This inner Name is often a Full Name, i.e., it specifies the Packet ID of the corresponding Data packet, but this is not a requirement.

  >> Common aliases include: pointer.

**Manifest**:

> a type of Data packet that contains Full Name Links to one or more Data Packets. Manifests group collections of related Data packets under a single Name. This has additional benefit of amortizing the signature verification cost for each Data packet referenced by the inner Links. Manifests typically contain additional metadata, e.g., the size (in bytes) of each linked Data packet and the cryptographic hash digest of all data contained in the linked Data packets.

## Terms related to Data-Centric Security

**Data-Centric Security**:

> A security property associated with the data packet, including data (data-centric) integrity, authenticity, and optionally confidentiality.  These the security properties stay with the data packet regardless where it is stored and how it is retrieved.

  >> Common aliases include: directly securing data packet

**Data Integrity**

> A cryptographic mechanism to ensure the consistency of the Data packet bits.  Data integrity property validates that the Data packet content has not been corrupted during transmission, e.g., over lossy channels.

**Data Authenticity**

> A cryptographic mechanism to ensure trustworthiness of a Data packet, based on a selected (e.g., by a consumer/producer) trust model.  Typically, data authenticity is assured through the use of asymmetric cryptographic signatures (e.g., RSA, ECDSA), but can also be realized using symmetric signature (e.g., HMAC) within trusted domains.

<!-- > a set of parameters carried in the data packet that is used to verify integrity and authenticity of the data packet.  The Data authenticator can include a cryptographic signature (RSA, ECDSA, HMAC, etc.), meta information about the signature (e.g., validity period), and additional information to facilitate signature verification (e.g., key locator, key ID, HMAC tag identifier, etc.) -->

  <!-- >> Common aliases include: content authenticator. -->

**Data Confidentiality**

> A cryptographic mechanism to ensure secrecy of a Data packet.  Data confidentiality includes separate mechanisms: content confidentiality and name confidentiality
<!-- > a set of parameters carried in the data packet that identify the needed algorithm and key identifiers to decrypt the confidential data. -->

**Content Confidentiality**

> A cryptographic mechanism to prevent an authorized party to get access to the plain-text payload of a Data packet.  Can be realized through encryption (symmetric, asymmetric, hybrid) and proper distribution of the decryption keys to authorized parties.

**Name Confidentiality**

> A cryptographic mechanism to prevent an observer of Interest-Data exchanges (e.g., intermediate router) from gaining detailed meta information about the Data packet.  This mechanism can be realized using encryption (same as content confidentiality) or obfuscation mechanisms.

## ICN Node related terms

**ICN Interface**:

> A generalization of the network interface that can represent a physical network interface (ethernet, wifi, bluetooth adapter, etc.), an overlay inter-node channel (IP/UDP tunnel, etc.), or an intra-node IPC channel to an application (unix socket, shared memory, intents, etc.).

  >> Common aliases include: face.

**ICN Consumer**:

> An ICN entity that requests data packets by generating and sending out interest packets towards local (using intra-node interfaces) or remote (using inter-node interfaces) ICN Forwarders.

  >> Common aliases include: consumer, information consumer, data consumer, consumer of the content.

**ICN Producer**:

> An ICN entity that creates data packets and makes them available for retrieval.

  >> Common aliases include: producer, publisher, information publisher, data publisher, data producer.

**ICN Forwarder**:

> An ICN entity that implements stateful forwarding.

  >> Common aliases include: ICN router.

**Data Mule**:

> An ICN entity that temporarily stores and potentially carries an interest or data packet before forwarding it to next ICN entity.

## Stateful forwarding plane related terms

**Stateful forwarding**:

> A forwarding process that records incoming interest packets in the PIT and uses the recorded information to forward the retrieved data packets back to the consumer(s). The recorded information can also be used to measure data plane performance, e.g., to adjust interest forwarding strategy decisions.

  >> Common aliases include: ICN Data plane, ICN Forwarding.

**Interest forwarding**:

> A process of forwarding interest packets using the names carried in the interests, creating an entry in PIT.  The forwarding decision is made by the Forwarding Strategy.

**Pending Interest Table (PIT)**:

> A database that records received and not yet satisfied interests with the interfaces from where they were received. The PIT can also store interfaces to where Interests were forwarded, and information to assess data plane performance. Interests for the same data are aggregated into a single PIT entry.

**Forwarding strategy**:

> A module of the ICN stateful forwarding (ICN data) plane that implements a decision on where/how to forward the incoming interest packet. The forwarding strategy can take input from ICN Forwarding Information Base (FIB), measured data plane performance parameters, and/or use other mechanisms to make the decision.

  >> Common aliases include: Interest forwarding strategy.

**Interest aggregation**:

> A process of combining multiple identical interest packets for the same data into a single PIT entry.

  >> Common aliases include: interest suppression, interest collapsing.

**Data forwarding**:

> A process of forwarding the incoming data packet to the incoming interface(s) recorded in the corresponding PIT entry (entries) and removing the PIT entry (entries).

**Satisfying an interest**:

> An overall process of returning content that satisfies the constraints imposed by the Interest, most notably a match in the provided name. Four different flavors of "matching" are used in an ICN network, as described below.

**Forwarding Information Base (FIB)**:

> a database that contains a set of prefixes, each prefix associated with one or more faces that can be used to retrieve data packets with names under the corresponding prefix. The list of faces for each prefix can be ranked, and each face may be associated with additional information to facilitate forwarding strategy decisions.

**Interest Nack**:

> a packet that contains the interest packet and optional annotation, which is sent by the router to the interface(s) the Interest was received from. Interest Nack is used to inform downstream ICN nodes about inability to forward the included interest packet. The annotation can describe the reason.

  >> Common aliases include: network NACK, interest return.

**Upstream (forwarding)**:

> forwarding packets in the direction of interests (i.e., interests are forwarded upstream): consumer, router, router, …, producer.

**Downstream (forwarding)**:

> forwarding packets in the direction opposite of interest forwarding (i.e., data and interest nacks are forwarded downstream): producer, router, ..., consumer(s).

**In-network storage**:

> a process of storing a data packet within the network (opportunistic on-path caches, dedicated on/off path caches, and managed in-network storage systems), so it can satisfy an incoming interest for this data packet. The in-network storages can optionally advertise the stored data packets in the routing plane.

**Opportunistic caching (or on-path in-network caching or just caching)**:

> a process of temporarily storing a forwarded data packet in the router’s memory (RAM or disk), so it can be used to satisfy future interests for the same data, if any.

**Managed caching (or off-path in-network storage)**:

> a process of temporarily, permanently, or scheduled storing of a selected (set of) data packet(s).

**Content Store (CS)**:

> a database on an ICN router that provides opportunistic caching.

**Managed in-network storage (repository, repo)**:

> an entity acting as an ICN producer that implements managed caching.

**ICN Routing plane**:

> an ICN protocol or a set of ICN protocols to exchange information about name space reachability.

**ICN Routing Information Base (RIB)**:

> a database that contains a set of prefix-face mappings that are produced by running one or multiple routing protocols. RIB is used to populate FIB.

<!--
**Off-path caching**:
-->

<!--
On-path caching:
-->

<!--
Cache poisoning
-->

<!--
**Name mapping resolution (same as name resolution, name mapping)**:
-->
<!-- AA: this seem to be not the right place. This implies a routing scalability solution that uses name mapping. May be we have a dedicated section on that -->

## Specific solution related terms

**Route-By-Name Routing (RBNR)**

**Lookup-By-Name Routing (LBNR)**

**Bread-crumbs routing**

**Replication-by-name**

**Routing Locator Signing**

## Uncategorized terms

**Content based**

**ICN API**

**Information Centric Delay Tolerant Network**

**Located-Named-Data**

**Sessionless**
