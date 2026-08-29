# 🚀 Enterprise Azure Landing Zone (Dynamic & Data-Driven)

[![Terraform](https://shields.io>=1.0.0-7B42BC?logo=terraform&logoColor=white&style=for-the-badge)](https://terraform.io)
[![Azure](https://shields.io)](https://terraform.io)
[![Architecture](https://shields.io)](#)

एक पूरी तरह से प्रोडक्शन-रेडी, अत्यधिक स्केलेबल और डेटा-ड्रिवेन (Data-Driven) **Azure Landing Zone Infrastructure as Code (IaC)**। इस आर्किटेक्चर को बिना किसी हार्डकोडिंग के, पूरी तरह से री-यूजेबल चाइल्ड मॉड्यूल्स और एडवांस्ड टेराफॉर्म लॉजिक पर डिज़ाइन किया गया है।

---

## 🛠️ Advanced Terraform Tech Stack Used

इस प्रोजेक्ट में टेराफॉर्म के सबसे एडवांस्ड और कॉर्पोरेट-लेवल के फीचर्स का इस्तेमाल किया गया है:

* **🔄 Dynamic `for_each` Loops:** चाइल्ड मॉड्यूल्स में हार्डकोडेड रिसोर्स ब्लॉक्स लिखने के बजाय `for_each` का इस्तेमाल किया गया है। इससे आप सिर्फ `.tfvars` में डेटा बढ़ाकर एक साथ कई वीनेट, सबनेट या वीएम बना सकते हैं।
* **🔍 `lookup()` Functions (Fail-Safe Code):** वीएम और एनआईसी (NIC) मॉड्यूल में `lookup()` का चालाकी से उपयोग किया गया है। अगर यूज़र `.tfvars` फ़ाइल को छोटा रखने के लिए ओएस डिस्क टाइप, साइज या इमेज पब्लिशर जैसी चीजें नहीं भी लिखता, तो कोड क्रैश होने के बजाय अपने आप डिफ़ॉलेक्ट रूप से **Ubuntu 22.04 LTS** और **Standard_B1s** जैसी सेटिंग्स उठा लेता है।
* **🔗 Parent & Child Modules Hierarchy:** पूरे इंफ्रास्ट्रक्चर को पैरेंट और चाइल्ड मॉड्यूल्स में डी-कपल्ड (Decoupled) किया गया है। इससे मुख्य कोडिंग लॉजिक पूरी तरह से सुरक्षित और री-यूजेबल रहता.
* **🎯 Module Outputs & Implicit Dependencies:** किसी भी `data` ब्लॉक का इस्तेमाल किए बिना, सबनेट और एनआईसी की लाइव IDs को `outputs.tf` के ज़रिए पैरेंट मॉड्यूल में ट्रांसफर किया गया है। टेराफॉर्म रन-टाइम पर लाइव आईडी को फेच करके सही एनआईसी और वीएम के साथ डायनेमिकली मैप कर देता है।
* **🚦 Explicit Dependencies (`depends_on`):** सही डिप्लॉयमेंट सीक्वेंस बनाए रखने के लिए पैरेंट लेवल पर `depends_on` का सटीक उपयोग किया गया है (जैसे: रिसोर्स ग्रुप बनने के बाद ही नेटवर्क बनेगा, और नेटवर्क पूरा होने के बाद ही वीएम बनेगी)।

---

## 🏗️ Core Dependency & Deployment Flow

टेराफॉर्म का इन-बिल्ट डिपेंडेंसी ग्राफ स्वचालित रूप से रिसोर्सेस को नीचे दिए गए क्रम में लाइव करता है:

---

## 🛠️ Quick Start Deployment Guide

### 1. Pre-requisites
* [Terraform v1.0.0+](https://terraform.io) installed.
* [Azure CLI](https://microsoft.com) authenticated via `az login`.

### 2. Execution Commands
अपने टर्मिनल को ओपन करें और रूट लेवल के `parents/` फ़ोल्डर में जाकर नीचे दिए गए कमांड्स रन करें:

```bash
# 1. प्रोवाइडर प्लगइन्स और लोकल मॉड्यूल्स को इनिशियलाइज़ करें
terraform init

# 2. इन्फ्रास्ट्रक्चर डिपेंडेंसी और स्टेट ग्राफ का प्लान जनरेट करें
terraform plan

# 3. लाइव क्लाउड एनवायरनमेंट पर डिप्लॉयमेंट शुरू करें
terraform apply -auto-approve
```

> 🧹 **Cost Optimization Tip:** टेस्टिंग पूरी होने के बाद अपने अज़ूर क्रेडिट्स बचाने के लिए `terraform destroy -auto-approve` कमांड चलाकर पूरे लैंडिंग ज़ोन को सिंगल-क्लिक में साफ़ करना न भूलें।

---

## 📂 Production Directory Layout

```text
├── child_modules/               # Core Architecture Building Blocks (Reusable)
│   ├── resource_group/          # Core Container Isolation Logic
│   ├── virtual_network/         # Network Layer Resource
│   ├── subnets/                 # Subnet Segmentations & Dynamic ID Outputs
│   ├── public ip/               # External Connectivity Mapping
│   ├── nsg/                     # Network Security Group Filters
│   ├── nic/                     # Smart Interface with Internal Lookup Configs
│   └── virtual_machine/         # Self-Healing VM Provisioning Module
└── parents/                     # Global Orchestration & Environment Layer
    ├── main.tf                  # Parent Loops & Implicit ID Association
    ├── variable.tf              # Schema Definitions for Object Maps
    ├── outputs.tf               # Consolidated Infrastructure Reports
    └── terraform.tfvars         # Your Minimal, Clean Config File (Nested Maps)
```

---
*Maintained with 💻 by DevOps Engineers who hate manual copy-pasting.*
