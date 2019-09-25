# A Sketch of the Big Picture of ICN

In networking terms, an ICN is a delivery infrastructure for named data. For other complementing views see [](#semantics-and-usage).

    requestor         zero or more           data sources or
    (node)          forwarding nodes         replica nodes
      |                 | ... |                  |...|
      |   Interest(n)   |     |   Interest(n)    |   |
      | --------------> |     | ---------------> |   |
      |                 |     | -------------------> |
      |                 |     |                  |   |
      |                 |     |  Data([n],c,[s]) |   |
      |                 |     | <--------------- |   |
      |                 |     | <------------------- |
      | Data([n],c,[s]) |     |                  |   |
      | <-------------- |     |                  |   |
^[fig:i-d-protocol::Request-Reply Protocol of ICN networking. Legend: n=name, c=content, s=signature.]

The following list describes the basic ICN concepts needed to discuss the implementation of this service abstraction.

**Request-Reply Protocol (Interest and Data Packet)**:

> An ICN's lookup service is implemented by defining two types of network packet formats: Interest packets that request content by name, and Data packets that carry the requested content.  The returned Data packet must match the request's parameters (e.g., having a partially or fully matching name). If the request is ambiguous and several Data packets would satisfy the request, the ICN network returns only one matching Data packet (flow balance between Interest and Data packets over individual links).

**Packet and Content Names**

> Without an irrefutable binding between the name of a Data packet and its content, Data packet names would be useless for fetching specific content. In ICN, verification of a Data packet's name-to-content binding is achieved through cryptographic means, either by (1) a cryptographic signature that explicitly binds an application-chosen name to a Data packet's content, or (2) relying on an implicit name (cryptographic hash of the Data packet with or without application-chosen name) that the data consumer obtained through other means.

**Data Authenticity and Encryption**:

> Any data consumer and network element can validate the authenticity of a Data packet by verifying its cryptographic name-to-content binding.  In contrast, whether a Data packet's content (payload) itself is encrypted or not is irrelevant to the ICN network. The use and management of content encryption keys is an application-layer concern.

**Trust**:

> Data authenticity is distinct from data trustworthiness, though the two concepts are related. A packet is authentic if it has a valid name-to-content binding. A packet is trustworthy, i.e., it comes from a reputable or trusted origin, if this binding is valid in the context of a trust model.
> <!-- For example, if a corresponding trust infrastructure (e.g., PKI) is in place, a packet's signature enables assessing authenticity with relation to real world identities which can be trusted or not. -->

**Segmenting and Versioning**:

> An ICN network will be engineered for some packet size limit. As application-level data objects will often be considerably larger, objects must be segmented into multiple Data packets. The names for these Data packets can, for example, be constructed by choosing one application-level object name to which a different suffix is added for each segment. The same method can be used to handle different versions of an application-level object by including a version number into the name of the overall object.

**Packet and Frame**:

> NDN and CCNx introduce Protocol Data Units (PDUs) which typically are larger than the maximum transmission unit of the underlying networking technology. We refer to PDUs as 'packets' and the (potentially fragmented) packet parts that traverse MTU-bound links as 'frames'.  Handling link-layer technologies which lead to fragmentation of ICN packets is done inside the ICN network and is not visible at the service interface.

**ICN Node**:

> A node within an ICN network can fulfill the role of a data producer, a data consumer, and/or a forwarder for Interest and Data packets. When a forwarder has connectivity to neighbor nodes, it performs Interest and Data packet forwarding in real time. It can also behave like a packet mule, that is it may carry an Interest or Data packet for some time before forwarding it to next node. An ICN node may also run routing protocols to assist its Interest forwarding decisions.

**Forwarding Plane**:

> The canonical way of implementing packet forwarding in an ICN network relies on three data structures that capture a node's state: a Forwarding Interest Table (FIB), a Pending Interest Table (PIT), and a Content Store (CS). It also utilizes Interest forwarding strategies which takes input from both FIB and measurements to make Interest forwarding decisions. When a node receives an Interest packet, it checks its CS and PIT to find a matching entry; if no match is found, the node records the Interest in its PIT and forwards the Interest to the next hop(s) towards the requested content, based on the information in its FIB.
> <!-- There exist alternative approaches which aim at reducing the amount of state that a nodes must keep, up to fully PIT-less designs using packets for keeping state but without changing the overall service model. -->
