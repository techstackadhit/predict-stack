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
cloud-insight-platform/
├── README.md
├── LICENSE
├── .gitignore

├── infrastructure/                 # Infrastruktur cloud & monitoring
│   ├── openstack/                 # Setup OpenStack DevStack
│   │   ├── install_devstack.sh
│   │   └── config/
│   ├── prometheus/                # Setup Prometheus + Exporter
│   │   ├── prometheus.yml
│   │   ├── node_exporter.service
│   │   └── run_prometheus.sh
│   ├── grafana/                   # Setup dan dashboard
│   │   ├── dashboard.json
│   │   ├── datasources.yaml
│   │   └── screenshots/
│   └── stress_test/              # Beban sistem (opsional)
│       ├── cpu_stress.sh
│       ├── ram_stress.sh
│       ├── disk_stress.sh
│       ├── network_stress.sh
│       └── logs/

├── data/
│   ├── raw/                       # Dataset asli dari Bitbrains
│   │   ├── bitbrains_cpu.csv
│   │   └── ...
│   ├── processed/                # Dataset setelah preprocessing
│   │   ├── vm01_cpu_clean.csv
│   │   ├── vm01_windowed.npz
│   │   └── ...
│   └── prometheus_export/       # Hasil ekspor dari Prometheus (untuk live data)
│       └── latest_cpu.csv

├── notebooks/                     # Eksplorasi dan prototyping
│   ├── 0_data_preprocessing.ipynb
│   ├── 1_model_training.ipynb
│   ├── 2_prediction_inference.ipynb
│   ├── 3_anomaly_detection.ipynb
│   └── shared_utils.ipynb

├── models/                        # Model terlatih
│   ├── lstm_cpu_model.h5
│   ├── lstm_ram_model.h5
│   └── scalers/

├── src/                           # Kode utama produksi
│   ├── data_loader.py
│   ├── model_lstm.py
│   ├── train.py
│   ├── predict.py
│   ├── preprocess.py
│   └── utils.py

├── api/                           # (Opsional) REST API inference
│   └── app.py

├── deployment/                    # Script deployment model
│   ├── run_inference.sh
│   └── config.json

├── figures/                       # Output grafik & visualisasi
│   ├── cpu_forecast.png
│   ├── ram_forecast.png
│   ├── anomaly_cpu.png
│   └── recovery_plot.png

├── reports/                       # Laporan teknis & akademik
│   ├── draft.md
│   ├── references.bib
│   └── figures/

├── evaluation/                    # Evaluasi & benchmark
│   ├── benchmark_cpu.md
│   ├── mae_mape_results.csv
│   └── timing_cpu_vs_gpu.csv

└── presentations/                 # Materi presentasi / pitch deck
    ├── pitch_deck.pdf
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

