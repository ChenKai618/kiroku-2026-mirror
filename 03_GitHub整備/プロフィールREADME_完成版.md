<div align="center">

# Chen Kai / 陳 凱

**Software Engineer** · Tokyo, Japan

金融系基幹システムのクラウド移行に従事。設計判断を記録に残す開発を実践しています。

<br>

<img src="https://img.shields.io/badge/AWS_Certified-Solutions_Architect_Professional-FF9900?style=flat-square&logo=amazonwebservices&logoColor=white" alt="AWS SAP">
<img src="https://img.shields.io/badge/AWS_Certified-Solutions_Architect_Associate-FF9900?style=flat-square&logo=amazonwebservices&logoColor=white" alt="AWS SAA">
<img src="https://img.shields.io/badge/AWS_Certified-Cloud_Practitioner-FF9900?style=flat-square&logo=amazonwebservices&logoColor=white" alt="AWS CLF">
<img src="https://img.shields.io/badge/JLPT-N1-BC002D?style=flat-square" alt="JLPT N1">

</div>

<br>

## 現在

**損害保険会社向け基幹システムのオンプレミス → AWS 移行案件**（大手SIer元請 / 12名体制）

ドキュメントが十分に整備されていないレガシーシステムに対し、
ソースコードから現行仕様を復元した上で外部設計書・内部設計書を作成。
単体テスト仕様書の作成・実施、移行前後の動作差分の検証まで担当しています。

インフラ基盤チームがAWS側を担当する体制のなかで、
開発側としても移行先環境を理解する必要があると考え、
AWS認定資格を CLF → SAA → SAP まで取得しました。

```
Java · Thymeleaf · AWS (EC2) · Git
```

<br>

## Tech Stack

**Backend**

![Java](https://img.shields.io/badge/Java-ED8B00?style=flat-square&logo=openjdk&logoColor=white)
![C#](https://img.shields.io/badge/C%23-512BD4?style=flat-square&logo=dotnet&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=flat-square&logo=python&logoColor=white)
![FastAPI](https://img.shields.io/badge/FastAPI-009688?style=flat-square&logo=fastapi&logoColor=white)
![ASP.NET Core](https://img.shields.io/badge/ASP.NET_Core-512BD4?style=flat-square&logo=dotnet&logoColor=white)

**Frontend**

![TypeScript](https://img.shields.io/badge/TypeScript-3178C6?style=flat-square&logo=typescript&logoColor=white)
![React](https://img.shields.io/badge/React-61DAFB?style=flat-square&logo=react&logoColor=black)
![Vite](https://img.shields.io/badge/Vite-646CFF?style=flat-square&logo=vite&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-06B6D4?style=flat-square&logo=tailwindcss&logoColor=white)

**Infrastructure**

![AWS](https://img.shields.io/badge/AWS-232F3E?style=flat-square&logo=amazonwebservices&logoColor=FF9900)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=flat-square&logo=docker&logoColor=white)
![SQLite](https://img.shields.io/badge/SQLite-003B57?style=flat-square&logo=sqlite&logoColor=white)
![Git](https://img.shields.io/badge/Git-F05032?style=flat-square&logo=git&logoColor=white)

<br>

## 個人開発

業務外で継続的に開発しています。設計判断は **ADR（Architecture Decision Record）** として文書化し、
ドメイン用語集と併せてリポジトリに残す進め方を実践しています。

### [Kotoba Studio](https://github.com/RainYaya/bikuri-NihongoLens)

字幕のない日本語動画に、AIで**単語レベルのタイムスタンプ付き字幕**を生成し、
動画・字幕・タイムラインを同期させた精読環境を提供するローカルアプリ。

`Python 3.11` `FastAPI` `WhisperX (faster-whisper large-v3)` `wav2vec2` `SQLite` `React 19` `TypeScript`

設計上の判断を [ADR 6本](https://github.com/RainYaya/bikuri-NihongoLens/tree/main/docs/adr) として記録しています。

- **[ADR-0002](https://github.com/RainYaya/bikuri-NihongoLens/blob/main/docs/adr/0002-background-task-model.md)** — 競合するリソースで並行方針を分ける
  GPUが1枚のため文字起こしは**直列**、ネットワーク律速のダウンロードは**並列**。
  将来並列転録を行うならVRAMの隔離が先、という*コードからは読めない制約*も残しています。
- **[ADR-0004](https://github.com/RainYaya/bikuri-NihongoLens/blob/main/docs/adr/0004-playback-as-single-source-of-truth.md)** — 再生時刻を唯一の状態源にする
  単語ハイライト・字幕の自動スクロール・タイムラインの再生ヘッドを同一の時計から導出。
  状態を2つ持たないことで、**同期のズレを構造的に排除**しました。

### [baku-yomi（爆読）](https://github.com/RainYaya/baku-yomi)

日中対訳EPUBから**逆翻訳**を練習し、AIが訳質を評価する語学学習アプリ。

`TypeScript` `React` `Docker` `Edge TTS` `VOICEVOX` `BYOK (OpenAI / Anthropic / Google)`

APIキーをブラウザのローカルストレージのみに保持し、サーバーへ送信しない **BYOK方式** を採用。
「鍵を預からない = 守るべきものを持たない」設計にしました。
連続読み上げでは次文の音声を先読みキャッシュし、待機時間を排除しています。

### [複合動詞図鑑](https://github.com/RainYaya/bikuri-goizukan)

日本語の複合動詞を「前項 × 後項」の組み合わせ地図として可視化する図鑑。

`React 19` `Vite` `静的JSON` — [デモ](https://bikuri-goizukan.vercel.app)

<br>

## 経歴

| 期間 | 内容 |
|---|---|
| 2026 – 現在 | 損害保険会社向け基幹システムの AWS 移行案件（開発メンバー） |
| 2024 | 大学卒業（ソフトウェア工学・学士）／優秀卒業生表彰 |
| 2019 – 2021 | 公的機関にてサーバー稼働監視システムの開発<br>`C#` `WPF` `Prism (MVVM)` `ASP.NET Core` `Entity Framework Core` |

複数サーバーホストのCPU・メモリ・ディスクを収集して可視化し、
閾値超過時にアラートを通知するシステムを、クライアントとAPIの双方を含めて実装しました。

<br>

## 言語

| | |
|---|---|
| 日本語 | ビジネスレベル（JLPT N1）— 業務における設計書作成・会議・報告 |
| 中国語 | ネイティブ |
| 英語 | 技術文書の読解 |
