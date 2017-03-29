# Terms by category

# Generic terms

**Information-Centric Networking (ICN)**:

> A networking architecture that retrieves data packets as response to interest packets.  Content-Centric Networking (CCN) and Named Data Networking (NDN) are two types of ICN architectures.

**Data packet**:

> a network-level packet that carries payload, uniquely identified by a name, and is directly secured.

  >> Common aliases include: data, data object, content object, content object packet, data message, named data object, named data.

**Interest packet**:

> a network-level packet that expresses the request for a data packet using either an exact name or a name prefix. An interest packet may optionally carry a set of additional restrictions (e.g. interest selectors). An interest may be associated with additional information to facilitate forwarding and can include interest lifetime, hop limit, forwarding hints, labels, etc. In different ICN designs, the set of additional associated information may vary.

  >> Common aliases include: interest, interest message, information request

<!--<t>Location-independence (?)</t>[LZ: I’d suggest to move all location/identifier related stuff into one place, which is not here]-->

**Data packet immutability**:

> after a data packet is created, it cannot change. If the content carried in the data packet is mutable, versioning should be used, so that each version uniquely identifies an immutable instance of the content. This allows disambiguation of coordination in distributed systems.

## Terms related to Name Types

**Name**:

> a data packet identifier. An ICN name is expressive, flexible and can be application-specific (akin to a HTTP URL). A Name may encode information about application context, semantics, locations (topological, geographical, hyperbolic, etc.), a service name, etc. A Name is a sequence of non-empty name components (see below).  The components of a name are said to be complete if they uniquely identify a single data packet. A Name is exact if its components are complete.

  >> Common aliases include: data name, interest name, content name.

**Name component**:

> a sequence of octets and optionally a numeric type representing a single label in the hierarchical structured name.

  >> Common aliases include: name segment (as in CCN).

**Packet ID**:

> a unique cryptographic identifier for a data packet. Typically, this is the cryptographic hash digest of a data packet, including its name, payload, meta information, and signature.

**Full Name**:

> An exact Name with the Packet ID of the corresponding data packet.

**Prefix Name**:

> A Name with incomplete components.

  >> Common aliases include: prefix.

**Selector**:

> Depending on the implementation, some restrictors show up as name components or as explicit fields of an interest. Selectors are not 'names' in a proper sense although they are able to "name content." Examples include selectors used to reference nameless objects, specify publisher restriction, etc.  In that sense, a single data packet will have multiple 'name-like properties' through which it can be referenced, interest packets are able to express them.

  >> Common aliases include: restrictor.

<!-- caw: this is misplaced a nonce has nothing to do with names -->
**Nonce**:

> Field of an interest packet that transiently 'names' an interest instance.

<!-- Naming scalability (?)  [LZ: probably a confusion with routing scalability] -->

## Terms related to Name Usage

**Naming scheme (ICN naming scheme)**:

> a convention/agreement/specification for the data packet naming. Structures a name space.

**Hierarchically structured naming**:

> the naming scheme that assigns and interprets name as a sequence of labels (name components) with hierarchical structure. A structure provides useful context information for the name.

>> Common aliases include: hierarchical naming, structured naming.

<!-- Name or parts of it can be “human-readable” to ease human interaction, but a hierarchical name is ultimately a sequence of ICN node interpretable name components. -->

**Flat naming**:

> the naming scheme that assigns and interprets name as a single label (name component) without any internal structure. This can be considered a special (or degenerated) case of structured names.

<!-- Information Identifiers (?): Location prefix (?): [LZ: I commented these out, to minimize confusions-->

**Segmentation**:

> a process of splitting large application content into a set of uniquely named data packets.  When using hierarchically structured name, each created data packet has a common prefix and additional component representing the segment (chunk) number.

  >> Common aliases include: chunking (as in CCN).

**Versioning**:

> a process of assigning a unique name to the revision of the content carried in the data packet.  When using a hierarchically structured name, the version of the data packet can be carried in a dedicated name component (e.g., prefix identifies data, unique version component identifies the revision of the data).

  <!-- What would be the difference when putting the version before the segment number? Is
  one then versioning individual segments instead of application layer content? -->

**Fragmentation**:

> a process of splitting data packets into frames so that they can be transmitted over the link with a smaller MTU size.

## Terms related to Data-Centric Security

**Directly secured data packet**:

> a data packet with inherent security properties (authenticity and optionally confidentiality), i.e., the security properties stay with the data packet regardless where it is stored and how it is retrieved.

**Data authenticator**:

> a set of parameters carried in the data packet that is used to verify integrity and authenticity of the data packet.  The Data authenticator can include a cryptographic signature (RSA, ECDSA, HMAC, etc.), meta information about the signature (e.g., validity period), and additional information to facilitate signature verification (e.g., key locator, key ID, HMAC tag identifier, etc.)

  >> Common aliases include: content authenticator.

**Data confidentiality credentials**:

> a set of parameters carried in the data packet that identify the needed algorithm and key identifiers to decrypt the confidential data.

**Key owner (same as Identity)**:

> an entity (user, device, program, program instance, module in the program instance, etc.) that owns private key(s) and the corresponding public key(s).

**Certificate**:

> a data packet that carries a public key as payload with optional additional meta information regarding the key (e.g., validity period, signature time, etc.).
> Ownership of the public key is made implicitly through the name of the packet or explicitly through meta information.
<!-- The key belongs to the key owner and can be associated with it implicitly through the name or explicitly through meta information. -->

**Key locator**:

> Parameter(s) that identify the ICN key. A key locatore can be the ICN key's name, its prefix, the ICN key ID, etc.

**Key ID**:

> Unique identifier (e.g., hash digest) for a public or secret key.

**Trust model**:

> a model or framework that defines trust relationships, i.e., which entity (represented by an ICN key) is authorized to sign which data packets.

**Trust schema**:

> a formal description of a trust model, e.g., in the form of a set of name-based relationships between data and key names and a set of the trust anchors.

**Trust anchor**:

> an ICN key that is assumed to be trusted within the context of a specific trust model.

**ICN key chain**:

> a chain of ICN keys (certificates) wherein each key (certificate) is signed by its predecessor and the head of the chain is a trust anchor, i.e., its authenticity is assumed.

  >> Common aliases include: certificate chain.

## ICN Node related terms

**ICN Interface**:

> a generalization of the network interface that can represent a physical network interface (ethernet, wifi, bluetooth adapter, etc.), an overlay inter-node channel (IP/UDP tunnel, etc.), or an intra-node IPC channel to an application (unix socket, shared memory, intents, etc.).

  >> Common aliases include: face.

**ICN Consumer**:

> an ICN entity that requests data packets by generating and sending out interest packets towards local (using intra-node interfaces) or remote (using inter-node interfaces) ICN Forwarders.

  >> Common aliases include: consumer, information consumer, data consumer, consumer of the content.

**ICN Producer**:

> an ICN entity that creates data packets and makes them available for retrieval.

  >> Common aliases include: producer, publisher, information publisher, data publisher, data producer.

**ICN Forwarder**:

> an ICN entity that implements stateful forwarding.

  >> Common aliases include: ICN router.

**Data Mule**:

> an ICN entity that temporarily stores and potentially carries an interest or data packet before forwarding it to next ICN entity.

## Stateful forwarding plane related terms

**Stateful forwarding**:

> a forwarding process that records incoming interest packets in the PIT and uses the recorded information to forward the retrieved data packets back to the consumer(s). The recorded information can also be used to measure data plane performance, e.g., to adjust interest forwarding strategy decisions.

  >> Common aliases include: ICN Data plane, ICN Forwarding.

**Interest forwarding**:

> a process of forwarding interest packets using the names carried in the interests, creating an entry in PIT.  The forwarding decision is made by the Forwarding Strategy.

**Pending Interest Table (PIT)**:

> a database that records received and not yet satisfied interests with the interfaces from where they were received. The PIT can also store interfaces to where Interests were forwarded, and information to assess data plane performance. Interests for the same data are aggregated into a single PIT entry.

**Forwarding strategy**:

> a module of the ICN stateful forwarding (ICN data) plane that implements a decision on where/how to forward the incoming interest packet. The forwarding strategy can take input from ICN Forwarding Information Base (FIB), measured data plane performance parameters, and/or use other mechanisms to make the decision.

  >> Common aliases include: Interest forwarding strategy.

**Interest match in FIB (longest prefix match)**:

> a process of finding a FIB entry with the longest name (in terms of name components) that is a prefix of the specified name.

**Interest match in PIT (exact match)**:

> a process of finding a PIT entry that stores the same as specified interest (including interest restrictions, if any).

**Interest aggregation**:

> a process of combining multiple identical interest packets for the same data into a single PIT entry.

  >> Common aliases include: interest suppression, interest collapsing.

**Data forwarding**:

> a process of forwarding the incoming data packet to the incoming interface(s) recorded in the corresponding PIT entry (entries) and removing the PIT entry (entries).

**Satisfying an interest**:

> overall process of returning content that satisfies the constraints imposed by the Interest, most notably a match in the provided name. Four different flavors of "matching" are used in an ICN network, as described below.

**Data match in PIT (all match)**:

> a process of finding (a set of) PIT entries that can be satisfied with the specified data packet.

**Interest match in CS (any match)**:

> a process of finding an entry in router’s content store that can satisfy the specified interest.

**Forwarding Information Base (FIB)**:

> a database that contains a set of prefixes, each prefix associated with one or more faces that can be used to retrieve data packets with names under the corresponding prefix. The list of faces for each prefix can be ranked, and each face may be associated with additional information to facilitate forwarding strategy decisions.

**Interest Nack**:

> a packet that contains the interest packet and optional annotation, which is sent by the router to the interface(s) the Interest was received from. Interest Nack is used to inform downstream ICN nodes about inability to forward the included interest packet. The annotation can describe the reason.

  >> Common aliases include: network NACK, interest return.

**Upstream forwarding**:

> forwarding packets in the direction of interests (i.e., interests are forwarded upstream): consumer, router, router, …, producer.

**Downstream forwarding**:

> forwarding packets in the direction opposite of interest forwarding (i.e., data and interest nacks are forwarded downstream): producer, router, ..., consumer(s).

**In-network storage**:

> a process of storing a data packet within the network (in routers opportunistic on-path caches, in dedicated on/off path caches, and managed in-network storage systems), so it can satisfy an incoming interest for this data packet. The in-network storages can optionally advertise the stored data packets in the routing plane.

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
