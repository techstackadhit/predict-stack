# Bottleneck Prediction System on OpenStack

Proyek Tugas Akhir kolaboratif untuk membangun sistem **monitoring**, **prediksi performa**, dan **estimasi operasional** pada cloud lokal berbasis OpenStack, menggunakan data time-series dan model ARIMA.

> Dibagi menjadi dua fokus utama:
> - **A:** Monitoring & Prediksi Sistem (CPU, RAM, dsb.)
> - **B:** Benchmarking Layanan & Estimasi Operasional (Response Time, RPS, Cost)

---

## Judul
Sistem Monitoring dan Prediksi Bottleneck Cloud OpenStack Berbasis Time-Series untuk Optimasi Layanan dan Estimasi Operasional

---

## Struktur Proyek

```
📦 ta-bottleneck-predictor/
├── README.md                     ← deskripsi umum proyek (utama)
├── .gitignore                    ← abaikan file seperti .pkl, .ipynb_checkpoints
├── data/
│   ├── raw/
│   │   ├── prometheus_cpu.csv         ← dari Prometheus (oleh A)
│   │   └── response_benchmark.csv     ← dari ab/wrk (oleh B)
│   └── processed/
│       ├── cpu_clean.csv              ← hasil clean CPU (A)
│       └── response_clean.csv         ← hasil clean response (B)
├── notebooks/
│   ├── A_cpu_forecast_arima.ipynb     ← ARIMA CPU usage (oleh A)
│   ├── B_response_forecast_arima.ipynb← ARIMA response time (oleh B)
│   └── shared_utils.ipynb             ← fungsi bantu preprocessing/visualisasi
├── models/
│   ├── cpu_model.pkl                  ← model ARIMA CPU (A)
│   └── response_model.pkl             ← model ARIMA response (B)
├── figures/
│   ├── cpu_forecast_plot.png          ← grafik prediksi CPU (A)
│   └── response_forecast_plot.png     ← grafik prediksi response (B)
├── grafana/
│   ├── dashboard.json                 ← export dashboard real-time (A)
│   └── screenshots/
│       └── cpu-panel.png              ← tangkapan layar panel CPU (A)
├── benchmark/
│   ├── ab_script.sh                   ← script load testing HTTP (B)
│   └── logs/
│       └── ab_result_2025-04-01.txt   ← log hasil benchmark (B)
├── reports/
│   ├── report-a-monitoring-cpu/
│   │   ├── draft.md                   ← laporan TA versi A
│   │   └── references.bib             ← daftar pustaka A
│   └── report-b-service-response/
│       ├── draft.md                   ← laporan TA versi B
│       └── references.bib             ← daftar pustaka B
├── presentations/
│   ├── final_slide.pptx               ← slide sidang TA bersama
│   └── presenter_notes.md             ← narasi/penjelasan presentasi
```

---

## Pembagian Kontributor

### Developer A – *Monitoring & CPU Forecast*
- Setup OpenStack (DevStack)
- Prometheus + Node Exporter + Grafana
- Prediksi CPU usage dengan ARIMA
- Visualisasi tren sistem & alert bottleneck

### Developer B – *Service Benchmark & Forecast*
- Web server dummy (Flask/Nginx) + Load Test (ab/wrk)
- Logging metrik layanan: response time, RPS, error rate
- Prediksi response time dengan ARIMA
- Estimasi throughput (RPS) & biaya cloud (autoscale sim)

---

## Teknologi & Tools

- 🖥**OpenStack DevStack** – platform cloud lokal
- **Prometheus** + **Grafana** – monitoring sistem real-time
- **ab**, **wrk** – HTTP benchmarking tools
- **Python** + `statsmodels`, `pmdarima` – ARIMA modeling
- **matplotlib**, **seaborn** – visualisasi analitik prediktif

---

## Output Utama
- Real-time monitoring dashboard (CPU, RAM, I/O, alert)
- Forecast performa sistem (CPU usage, response time)
- Estimasi RPS dan biaya autoscaling berbasis prediksi
- Laporan TA terpisah A & B, terintegrasi dalam presentasi

---

## Insight Proyek
Sistem ini tidak hanya memantau kondisi saat ini, tapi juga **memprediksi bottleneck** sebelum terjadi, dan memberikan estimasi dampak bisnis (biaya & kapasitas) berbasis data real-time.

---

## Lisensi
MIT License – feel free to fork, improve, and cite.  
Silakan digunakan sebagai referensi akademik atau pengembangan praktis dalam sistem cloud monitoring & forecasting.
