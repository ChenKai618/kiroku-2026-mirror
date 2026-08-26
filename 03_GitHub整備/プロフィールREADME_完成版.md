<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:1a2980,50:26619c,100:0f2027&height=180&section=header&text=Chen%20Kai&fontSize=52&fontColor=ffffff&fontAlignY=36&desc=Software%20Engineer%20%C2%B7%20Tokyo&descSize=17&descAlignY=58" width="100%" alt="header"/>

<a href="https://github.com/RainYaya">
  <img src="https://readme-typing-svg.demolab.com?font=JetBrains+Mono&weight=500&size=20&duration=3200&pause=900&color=58A6FF&center=true&vCenter=true&width=620&lines=Migrating+a+core+insurance+system+to+AWS;Architecture+decisions%2C+written+down;%E8%A8%AD%E8%A8%88%E5%88%A4%E6%96%AD%E3%82%92%E8%A8%98%E9%8C%B2%E3%81%AB%E6%AE%8B%E3%81%99" alt="typing"/>
</a>

<br><br>

<img src="https://custom-icon-badges.demolab.com/badge/AWS%20SAP-Solutions%20Architect%20Professional-FF9900?style=for-the-badge&logo=aws&logoColor=white&labelColor=232F3E" alt="SAP"/>
<img src="https://custom-icon-badges.demolab.com/badge/SAA-Associate-FF9900?style=for-the-badge&logo=aws&logoColor=white&labelColor=232F3E" alt="SAA"/>
<img src="https://custom-icon-badges.demolab.com/badge/CLF-Practitioner-FF9900?style=for-the-badge&logo=aws&logoColor=white&labelColor=232F3E" alt="CLF"/>
<img src="https://img.shields.io/badge/JLPT-N1-BC002D?style=for-the-badge&labelColor=8B0000" alt="N1"/>

</div>

<br>

<div align="center">

### 🛠 Stack

<img src="https://skillicons.dev/icons?i=java,cs,dotnet,python,fastapi,ts,react&theme=dark&perline=7" alt="stack 1"/>
<br>
<img src="https://skillicons.dev/icons?i=aws,docker,tailwind,vite,sqlite,git,linux&theme=dark&perline=7" alt="stack 2"/>

</div>

<br>

<div align="center">

### ⚡ Currently

</div>

```yaml
project:  損害保険 基幹システム  →  オンプレミス から AWS へ移行
scale:    大手SIer元請  ·  12名体制
role:     開発メンバー — ソースコード解析 / 外部設計 / 内部設計 / UT
stack:    Java  ·  Thymeleaf  ·  AWS EC2  ·  Git
learning: 移行先を理解するため CLF → SAA → SAP を取得
```

<br>

<div align="center">

### 🧩 Projects

</div>

<table>
<tr>
<td width="50%" valign="top">

#### 🎬 [Kotoba Studio](https://github.com/RainYaya/bikuri-NihongoLens)

字幕のない日本語動画に、**単語レベルの<br>タイムスタンプ付き字幕**を生成する精読アプリ

<img src="https://skillicons.dev/icons?i=python,fastapi,react,ts&theme=dark" height="34"/>

`WhisperX` `wav2vec2` `SQLite` `SSE`

**→ [ADR 6本](https://github.com/RainYaya/bikuri-NihongoLens/tree/main/docs/adr)** で設計判断を記録

</td>
<td width="50%" valign="top">

#### 📖 [baku-yomi](https://github.com/RainYaya/baku-yomi)

日中対訳EPUBで**逆翻訳**を練習し、<br>AIが訳質を評価する語学学習アプリ

<img src="https://skillicons.dev/icons?i=ts,react,docker&theme=dark" height="34"/>

`Edge TTS` `VOICEVOX` `BYOK`

**→** APIキーをサーバーに送らない設計

</td>
</tr>
<tr>
<td width="50%" valign="top">

#### 🗺 [複合動詞図鑑](https://github.com/RainYaya/bikuri-goizukan)

日本語の複合動詞を **前項 × 後項** の<br>組み合わせ地図として可視化

<img src="https://skillicons.dev/icons?i=react,vite&theme=dark" height="34"/>

**→ [Live Demo](https://bikuri-goizukan.vercel.app)**

</td>
<td width="50%" valign="top">

#### 📡 Server Monitor `2019–2021`

複数ホストの **CPU / メモリ / ディスク**を<br>収集・可視化し、閾値超過で通知

<img src="https://skillicons.dev/icons?i=cs,dotnet&theme=dark" height="34"/>

`WPF` `Prism (MVVM)` `EF Core`

</td>
</tr>
</table>

<br>

<div align="center">

### 📐 Design Decisions

*コードを読んでも分からない判断を、ADRとして残しています*

</div>

<table>
<tr><td>

**[ADR-0002](https://github.com/RainYaya/bikuri-NihongoLens/blob/main/docs/adr/0002-background-task-model.md)** — 競合するリソースで並行方針を分ける

> 文字起こしは **直列**（GPUが1枚 → VRAM競合でOOM）
> ダウンロードは **並列**（ネットワーク律速 → GPUを取り合わない）
>
> *残した制約：並列転録をするならVRAMの隔離が先*

</td></tr>
<tr><td>

**[ADR-0004](https://github.com/RainYaya/bikuri-NihongoLens/blob/main/docs/adr/0004-playback-as-single-source-of-truth.md)** — 再生時刻を唯一の状態源にする

> 単語ハイライト・字幕の自動スクロール・タイムラインの再生ヘッド
> — 3つの表示面を同一の時計から導出
>
> *状態を2つ持たない → 同期のズレを構造的に排除*

</td></tr>
</table>

<br>

<div align="center">

<img src="https://github-readme-stats-git-masterrstaa-rickstaa.vercel.app/api/top-langs/?username=RainYaya&layout=compact&langs_count=8&theme=github_dark&hide_border=true&bg_color=00000000&title_color=58A6FF&text_color=8B949E" height="150" alt="langs"/>
<img src="https://github-readme-streak-stats.herokuapp.com/?user=RainYaya&theme=github-dark-blue&hide_border=true&background=00000000&stroke=30363D&ring=58A6FF&fire=FF9900&currStreakLabel=58A6FF" height="150" alt="streak"/>

<br><br>

`日本語 N1` &nbsp;·&nbsp; `中文 母語` &nbsp;·&nbsp; `English 技術文書`

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f2027,50:26619c,100:1a2980&height=110&section=footer" width="100%" alt="footer"/>

</div>
