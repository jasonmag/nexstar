# db/seeds.rb
Profile.first_or_create!(
  name: "Jason Maglangit",
  role: "Full-Stack Ruby on Rails • Data Engineering • DevOps",
  hero_title: "About Me",
  hero_subtitle: "My journey as a technologist",
  intro: "I help founders and teams launch, scale, and automate digital products...",
  who_i_am: <<~TEXT,
    I’m a software engineer who enjoys turning messy, real-world requirements into clean, reliable systems.

    I build Rails apps with crisp UX, wire up data platforms following the medallion architecture, and automate deployments so teams can move quickly without breaking things.
  TEXT
  what_i_do: <<~TEXT,
    - Design & build Rails apps with clean UX (Hotwire/Stimulus/Tailwind; React/Vue when it fits).
    - Deliver lakehouse ETL/ELT with Azure Databricks & Microsoft Fabric (bronze/silver/gold).
    - Stand up cloud infra with Bicep/Terraform and ship via CI/CD.
    - Integrate third-party APIs and automate data workflows.
    - Coach teams on delivery, reliability, and developer experience.
  TEXT
  highlights: <<~TEXT,
    Built reporting pipelines (Bronze/Silver/Gold) with Databricks & Fabric; automated ingestion and BI-ready datasets.
    Migrated apps & infra from AWS to Azure (Bicep, CI/CD, Key Vault, Web Apps).
    Full-stack feature work on assessment/analytics platforms (Rails + Vue/React, Postgres).
  TEXT
  toolbox: "Ruby on Rails,Hotwire/Stimulus,Tailwind CSS,React,Vue.js,PostgreSQL,Azure,Databricks,Microsoft Fabric,Docker,Terraform/Bicep,CI/CD",
  availability_message: "Available for remote contracts, consulting, or your next big idea.",
  email: "hello@jasonmag.com",
  github_url: "https://github.com/jasonmag",
  linkedin_url: "https://www.linkedin.com/in/jasonmaglangit"
)

puts "✅ Seeded About"