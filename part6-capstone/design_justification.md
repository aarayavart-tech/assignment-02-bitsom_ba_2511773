## Storage Systems

To address the hospital’s needs, a multi-layered hybrid storage architecture is recommended.

For core transactional data such as patient records, prescriptions, and billing details, an OLTP relational database like MySQL is utilized. This ensures high consistency, accuracy, and reliability, which are essential in healthcare environments.

A Data Lake (for example, AWS S3) is used to store raw data from various sources, including ICU device streams, system logs, and unstructured clinical notes. This approach supports flexible storage for both structured and unstructured data.

For analytics, a Data Warehouse (such as Snowflake) is employed to handle workloads like monthly reports on bed occupancy and departmental expenses. It enables efficient SQL querying and supports business intelligence and dashboarding.

A Vector Database (e.g., Pinecone) is incorporated to enable semantic search across patient records. This allows healthcare professionals to perform natural language queries and quickly retrieve relevant patient information.

In addition, a machine learning pipeline leverages historical data from both the Data Lake and Data Warehouse to predict outcomes such as patient readmission risk.

## OLTP vs OLAP Boundary

The OLTP layer (MySQL) is responsible for handling real-time transactional activities, including patient admissions, updates, and billing operations. It is optimized for high-speed inserts and updates.

The OLAP layer starts at the Data Warehouse, where data from the OLTP system and Data Lake is processed, transformed, and stored for analysis. This layer is designed for complex queries, reporting, and decision-making.

The transition point lies in the data ingestion and ETL processes, where operational data is extracted, transformed, and loaded into the analytical system.

## Trade-offs

A key trade-off in this architecture is balancing data latency with consistency. Incorporating real-time streaming tools like Kafka increases system complexity and may introduce slight delays in achieving consistency across downstream systems.

To address this, a hybrid processing strategy can be adopted—critical data can be handled in near real-time, while less time-sensitive analytics can rely on batch processing.

Another challenge is the added complexity from integrating multiple systems such as the Data Lake, Data Warehouse, and Vector Database. This can be managed effectively by using managed cloud solutions along with robust monitoring and orchestration tools to maintain system performance and scalability.