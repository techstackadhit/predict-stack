# ☁️ Cloud Insight Platform

**Intelligent Monitoring & Predictive Analytics for Private Cloud Infrastructure**

---

## 🔍 Overview

Cloud Insight Platform adalah sistem terintegrasi untuk melakukan **monitoring real-time**, **prediksi beban sistem**, dan **deteksi anomali** pada infrastruktur cloud privat berbasis OpenStack. Sistem ini dirancang untuk memberikan visibilitas menyeluruh terhadap performa VM dan host, serta melakukan prediksi multi-langkah terhadap potensi bottleneck atau overload menggunakan model deep learning berbasis time-series.

---

## 🎯 Fitur Utama

- ✅ Monitoring real-time dengan Prometheus + Grafana
- 🔄 Simulasi stress test untuk validasi dan benchmarking
- 🔮 Prediksi beban (CPU, RAM, Disk, Network) dengan model LSTM
- ⚠️ Deteksi anomali performa secara real-time & prediktif
- 📈 Visualisasi tren pemulihan dan hubungan antar resource
- ❤️ Skor kesehatan VM berdasarkan prediksi agregat
- 🚀 Rekomendasi autoscaling berdasarkan hasil forecast
- 🔌 Modular dan siap dikembangkan menjadi platform SaaS

---

## 🧱 Arsitektur Sistem

1. **Infrastruktur**: OpenStack DevStack + Prometheus + Node Exporter
2. **Monitoring & Visualisasi**: Prometheus mengumpulkan metrik, Grafana menampilkan dashboard
3. **Data Layer**: Dataset Bitbrains atau data hasil monitoring aktual
4. **Model Layer**: LSTM Encoder–Decoder untuk prediksi multistep time-series
5. **Service Layer**: Inference script dan API untuk akses hasil prediksi
6. **Presentation Layer**: Dashboard interaktif, grafik prediksi & laporan anomaly

---

## 📁 Struktur Direktori
```
ta-bottleneck-predictor/
├── README.md
├── LICENSE
├── .gitignore

├── infrastructure/                 # Semua setup sistem nyata (OpenStack, Prometheus, Grafana, stress)
│   ├── openstack/
│   ├── prometheus/
│   ├── grafana/
│   └── stress_test/

├── data/
│   ├── raw/                        # File per-VM Bitbrains (1.csv - 1250.csv)
│   └── processed/                 # Global dataset hasil preprocess
│       ├── all_data.csv
│       ├── X_all.npy
│       ├── y_all.npy
│       └── scaler.pkl

├── notebooks/                     # Prototyping, EDA, training, evaluasi
│   ├── 0_data_preprocessing.ipynb
│   ├── 1_model_training.ipynb
│   ├── 2_prediction_inference.ipynb
│   ├── 3_anomaly_detection.ipynb
│   ├── 4_autoscaling_simulation.ipynb
│   └── shared_utils.ipynb

├── models/                        # Model terlatih (.h5)
│   ├── lstm_global_model.h5
│   └── anomaly_classifier.h5

├── src/                           # Utility python files for reuse or production
│   ├── utils.py                   # Load/save scaler, dataset, metrik
│   └── inference_api.py           # (Opsional) bisa jadi app.py juga

├── deployment/                    # Script bash/config
│   ├── run_inference.sh
│   └── config.json

├── figures/                       # Visualisasi grafik output
│   ├── forecast_cpu.png
│   ├── anomaly_roc.png
│   └── autoscaling_simulation.png

├── evaluation/                    # CSV hasil evaluasi
│   ├── error_per_resource.csv
│   └── anomaly_scores.csv

├── reports/                       # Laporan akhir / skripsi
│   ├── draft.md
│   └── references.bib

└── presentations/                 # Final slide & presentasi
    ├── final_presentation.pptx
    └── presenter_notes.md
```

---

## 📊 Dataset

Platform ini menggunakan:
- ✅ **Bitbrains GWA-T-12 Dataset** (public cloud workload traces)
- 🔄 Data real-time dari **Prometheus Exporter** (opsional untuk test langsung)

---

## ⚙️ Tools & Framework

- **OpenStack DevStack** – Infrastruktur cloud
- **Prometheus + Node Exporter** – Monitoring agent
- **Grafana** – Visualisasi performa resource
- **Python (TensorFlow, scikit-learn, pandas)** – Model prediktif & pipeline ML
- **Bitbrains Dataset** – Sumber data time-series multivariat cloud workload

---

## 🚀 Status

✅ Core monitoring & model siap  
🧪 Sedang integrasi ke pipeline API + autoscaling simulation  
🔜 Rencana ke depan: custom web UI, multi-cloud support, SaaS model

---

## 📝 Lisensi

Proyek ini berlisensi **MIT** / **Apache 2.0** – silakan gunakan, modifikasi, dan kontribusikan kembali dengan atribusi yang sesuai.

---

## 🤝 Kontribusi

Pull request, issue, dan diskusi sangat disambut!  
Untuk kontribusi besar, silakan buka issue terlebih dahulu untuk diskusi lebih lanjut.

---

## 📬 Kontak

Jika ada pertanyaan atau ingin kolaborasi, silakan hubungi:  
📧 `namamu@domain.com`

