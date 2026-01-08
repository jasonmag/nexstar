# db/seeds.rb
Profile.first_or_create!(
  name: "Jason Maglangit",
  role: "Data Engineer • Software Engineer • Cloud & DevOps",
  hero_title: "About Me",
  hero_subtitle: "Building reliable systems from data to product",

  intro: "I help founders and teams design, build, and scale reliable software and data systems — from MVPs to production platforms.",

  who_i_am: <<~TEXT,
    I’m a software engineer who enjoys turning messy, real-world requirements into clean, reliable systems.

    My work spans full-stack applications, data platforms built on lakehouse architectures, and cloud infrastructure that supports teams as they grow. I care deeply about clarity, maintainability, and building systems that hold up under real-world usage.
  TEXT

  what_i_do: <<~TEXT,
    - Build production-ready applications and data platforms, from ingestion to user-facing features.
    - Design and operate lakehouse ETL/ELT pipelines using Azure Databricks & Microsoft Fabric (Bronze/Silver/Gold).
    - Ship cloud infrastructure with Bicep/Terraform and automated CI/CD pipelines.
    - Integrate third-party APIs, event-driven data sources, and operational systems.
    - Help teams improve delivery speed, reliability, and developer experience.
  TEXT

  highlights: <<~TEXT,
    Built reporting and analytics pipelines using Databricks and Microsoft Fabric with Bronze/Silver/Gold layers.
    Migrated applications and infrastructure from AWS to Azure using Bicep, CI/CD, and managed cloud services.
    Delivered full-stack features for assessment, education, and analytics platforms using Rails, Vue/React, and PostgreSQL.
  TEXT

  toolbox: "Python,SQL,PySpark,Azure Databricks,Microsoft Fabric,Lakehouse Architecture,Ruby on Rails,Hotwire/Stimulus,Tailwind CSS,React,Vue.js,PostgreSQL,Docker,Terraform,Bicep,CI/CD",

  availability_message: "Available for remote contracts, consulting, or building your next data-driven platform.",

  email: "hello@jasonmag.com",
  github_url: "https://github.com/jasonmag",
  linkedin_url: "https://www.linkedin.com/in/jasonmaglangit"
)

puts "✅ Seeded About"
