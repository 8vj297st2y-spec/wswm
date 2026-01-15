<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <title>マサのウォータースタンプカード</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <style>
    :root {
      --bg: #f0f7ff;
      --primary: #4aa3ff;
      --primary-dark: #1f7ad6;
      --accent: #ff7ac4;
      --accent-dark: #e45fa9;
      --card-bg: #ffffff;
      --text-main: #233143;
      --text-sub: #5f6b7a;
    }

    * {
      box-sizing: border-box;
      -webkit-tap-highlight-color: transparent;
    }

    body {
      margin: 0;
      font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", "Segoe UI", sans-serif;
      background: radial-gradient(circle at top, #d9f0ff 0, #f0f7ff 40%, #ffffff 100%);
      color: var(--text-main);
      display: flex;
      justify-content: center;
      align-items: stretch;
      min-height: 100vh;
    }

    .app {
      width: 100%;
      max-width: 480px;
      min-height: 100vh;
      padding: 16px 16px 24px;
      display: flex;
      flex-direction: column;
      gap: 16px;
    }

    .header {
      display: flex;
      align-items: center;
      gap: 12px;
      padding: 12px 14px;
      border-radius: 16px;
      background: linear-gradient(135deg, #ffffffcc, #e5f2ff);
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.06);
    }

    .masa-avatar {
      width: 56px;
      height: 56px;
      border-radius: 50%;
      background: radial-gradient(circle at 30% 20%, #ffe6f5 0, #ffb3dd 35%, #ff7ac4 70%, #ff4fae 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      color: #fff;
      font-weight: 800;
      font-size: 22px;
      box-shadow: 0 6px 14px rgba(255, 122, 196, 0.6);
      position: relative;
      overflow: hidden;
    }

    .masa-avatar::after {
      content: "✨";
      position: absolute;
      right: 4px;
      top: 4px;
      font-size: 14px;
    }

    .header-text-main {
      font-size: 18px;
      font-weight: 700;
      margin-bottom: 4px;
    }

    .header-text-sub {
      font-size: 13px;
      color: var(--text-sub);
      line-height: 1.4;
    }

    .badge {
      display: inline-flex;
      align-items: center;
      gap: 4px;
      padding: 2px 8px;
      border-radius: 999px;
      background: rgba(74, 163, 255, 0.1);
      color: var(--primary-dark);
      font-size: 11px;
      font-weight: 600;
      margin-top: 4px;
    }

    .card {
      background: var(--card-bg);
      border-radius: 20px;
      padding: 16px 16px 18px;
      box-shadow: 0 12px 30px rgba(0, 0, 0, 0.08);
      display: flex;
      flex-direction: column;
      gap: 14px;
      flex: 1;
    }

    .card-title-row {
      display: flex;
      justify-content: space-between;
      align-items: center;
      gap: 8px;
    }

    .card-title {
      font-size: 17px;
      font-weight: 700;
      display: flex;
      align-items: center;
      gap: 6px;
    }

    .card-title span {
      font-size: 20px;
    }

    .reset-btn {
      border: none;
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      background: #f4f6fb;
      color: var(--text-sub);
      display: inline-flex;
      align-items: center;
      gap: 4px;
      cursor: pointer;
      transition: background 0.15s, transform 0.1s;
    }

    .reset-btn:active {
      transform: scale(0.96);
      background: #e4e7f2;
    }

    .progress-section {
      display: flex;
      flex-direction: column;
      gap: 6px;
    }

    .progress-label-row {
      display: flex;
      justify-content: space-between;
      font-size: 12px;
      color: var(--text-sub);
    }

    .progress-bar {
      position: relative;
      width: 100%;
      height: 12px;
      border-radius: 999px;
      background: #e4edf7;
      overflow: hidden;
    }

    .progress-fill {
      position: absolute;
      left: 0;
      top: 0;
      bottom: 0;
      width: 0%;
      border-radius: inherit;
      background: linear-gradient(90deg, #4aa3ff, #7f8dff, #ff7ac4);
      transition: width 0.25s ease-out;
    }

    .progress-bubbles {
      position: absolute;
      inset: 0;
      pointer-events: none;
      background-image: radial-gradient(circle at 10% 50%, rgba(255, 255, 255, 0.7) 0, transparent 40%),
        radial-gradient(circle at 40% 30%, rgba(255, 255, 255, 0.7) 0, transparent 40%),
        radial-gradient(circle at 70% 60%, rgba(255, 255, 255, 0.7) 0, transparent 40%),
        radial-gradient(circle at 90% 40%, rgba(255, 255, 255, 0.7) 0, transparent 40%);
      opacity: 0.0;
      transition: opacity 0.25s;
    }

    .progress-bar.active .progress-bubbles {
      opacity: 0.7;
    }

    .stamp-grid {
      display: grid;
      grid-template-columns: repeat(5, 1fr);
      gap: 10px;
      margin-top: 4px;
    }

    .stamp-slot {
      width: 100%;
      aspect-ratio: 1 / 1;
      border-radius: 14px;
      border: 2px dashed #c7d4e5;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
      color: #c7d4e5;
      position: relative;
      overflow: hidden;
      background: #f7f9fd;
    }

    .stamp-slot.filled {
      border-style: solid;
      border-color: rgba(255, 122, 196, 0.7);
      background: radial-gradient(circle at 30% 20%, #ffe6f5 0, #ffd1ee 40%, #ffc0e8 70%, #ffb0e2 100%);
      color: #ff3f9f;
      box-shadow: 0 6px 14px rgba(255, 122, 196, 0.5);
      animation: pop 0.25s ease-out;
    }

    .stamp-slot.filled::after {
      content: "💧";
      position: absolute;
      font-size: 26px;
      opacity: 0.25;
    }

    @keyframes pop {
      0% {
        transform: scale(0.6);
        opacity: 0.0;
      }
      100% {
        transform: scale(1);
        opacity: 1;
      }
    }

    .stamp-button-area {
      margin-top: 4px;
      display: flex;
      flex-direction: column;
      gap: 8px;
      align-items: stretch;
    }

    .stamp-btn {
      border: none;
      border-radius: 999px;
      padding: 14px 18px;
      font-size: 16px;
      font-weight: 700;
      background: linear-gradient(135deg, #4aa3ff, #7f8dff);
      color: #ffffff;
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 8px;
      cursor: pointer;
      box-shadow: 0 10px 22px rgba(74, 163, 255, 0.5);
      transition: transform 0.1s ease-out, box-shadow 0.1s ease-out, filter 0.1s;
    }

    .stamp-btn:active {
      transform: translateY(2px) scale(0.98);
      box-shadow: 0 4px 10px rgba(74, 163, 255, 0.4);
      filter: brightness(0.97);
    }

    .stamp-btn span.icon {
      font-size: 20px;
    }

    .hint-text {
      font-size: 12px;
      color: var(--text-sub);
      text-align: center;
    }

    .reward-card {
      margin-top: 4px;
      padding: 10px 12px;
      border-radius: 16px;
      background: linear-gradient(135deg, #fff3fb, #ffe9ff);
      border: 1px solid rgba(255, 122, 196, 0.4);
      display: flex;
      align-items: center;
      gap: 10px;
      font-size: 13px;
      color: #b03a8a;
    }

    .reward-icon {
      width: 34px;
      height: 34px;
      border-radius: 12px;
      background: #ffffffaa;
      display: flex;
      align-items: center;
      justify-content: center;
      font-size: 20px;
    }

    .reward-text-main {
      font-weight: 700;
      margin-bottom: 2px;
    }

    .reward-text-sub {
      font-size: 11px;
    }

    /* マサ通知ポップアップ */
    .masa-popup-overlay {
      position: fixed;
      inset: 0;
      background: rgba(0, 0, 0, 0.25);
      display: none;
      align-items: flex-start;
      justify-content: center;
      padding-top: 70px;
      z-index: 50;
    }

    .masa-popup-overlay.show {
      display: flex;
      animation: fadeIn 0.18s ease-out;
    }

    @keyframes fadeIn {
      from {
        opacity: 0;
      }
      to {
        opacity: 1;
      }
    }

    .masa-popup {
      width: min(92%, 420px);
      border-radius: 18px;
      background: #f9fbff;
      box-shadow: 0 16px 40px rgba(0, 0, 0, 0.25);
      overflow: hidden;
      animation: slideUp 0.22s ease-out;
      position: relative;
    }

    @keyframes slideUp {
      from {
        transform: translateY(18px);
        opacity: 0;
      }
      to {
        transform: translateY(0);
        opacity: 1;
      }
    }

    .masa-popup-header {
      display: flex;
      align-items: center;
      gap: 10px;
      padding: 10px 12px;
      background: linear-gradient(135deg, #4aa3ff, #7f8dff);
      color: #ffffff;
    }

    .masa-popup-avatar {
      width: 40px;
      height: 40px;
      border-radius: 50%;
      background: radial-gradient(circle at 30% 20%, #ffe6f5 0, #ffb3dd 35%, #ff7ac4 70%, #ff4fae 100%);
      display: flex;
      align-items: center;
      justify-content: center;
      font-weight: 800;
      font-size: 18px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.25);
      position: relative;
      overflow: hidden;
    }

    .masa-popup-avatar::after {
      content: "💄";
      position: absolute;
      right: 2px;
      bottom: 2px;
      font-size: 13px;
    }

    .masa-popup-title {
      font-size: 14px;
      font-weight: 700;
      display: flex;
      flex-direction: column;
      gap: 2px;
    }

    .masa-popup-title small {
      font-size: 11px;
      opacity: 0.85;
    }

    .masa-popup-body {
      padding: 14px 14px 12px;
      font-size: 14px;
      line-height: 1.6;
      color: var(--text-main);
    }

    .masa-popup-body .tagline {
      font-size: 11px;
      color: var(--text-sub);
      margin-top: 6px;
    }

    .masa-popup-footer {
      padding: 8px 10px 10px;
      display: flex;
      justify-content: flex-end;
      gap: 8px;
    }

    .popup-btn {
      border: none;
      border-radius: 999px;
      padding: 6px 12px;
      font-size: 12px;
      font-weight: 600;
      cursor: pointer;
    }

    .popup-btn-main {
      background: var(--primary);
      color: #ffffff;
      box-shadow: 0 4px 10px rgba(74, 163, 255, 0.4);
    }

    .popup-btn-main:active {
      transform: translateY(1px);
      box-shadow: 0 2px 6px rgba(74, 163, 255, 0.4);
    }

    .popup-btn-sub {
      background: transparent;
      color: var(--text-sub);
    }

    /* お祝い用コンフェッティ */
    .confetti {
      position: fixed;
      inset: 0;
      pointer-events: none;
      overflow: hidden;
      z-index: 40;
      display: none;
    }

    .confetti.show {
      display: block;
    }

    .confetti-piece {
      position: absolute;
      width: 8px;
      height: 14px;
      background: #ff7ac4;
      opacity: 0.9;
      border-radius: 2px;
      animation: confetti-fall 1.4s linear forwards;
    }

    @keyframes confetti-fall {
      0% {
        transform: translate3d(0, -20px, 0) rotateZ(0deg);
      }
      100% {
        transform: translate3d(0, 110vh, 0) rotateZ(360deg);
      }
    }

    .footer-note {
      font-size: 11px;
      color: var(--text-sub);
      text-align: center;
      margin-top: 4px;
    }

    @media (min-height: 720px) {
      .app {
        padding-top: 24px;
        padding-bottom: 28px;
      }
      .card {
        padding: 18px 18px 20px;
      }
    }
  </style>
</head>
<body>
  <div class="app">
    <header class="header">
      <div class="masa-avatar">マ</div>
      <div>
        <div class="header-text-main">マサのウォーターチャレンジ💧</div>
        <div class="header-text-sub">
          「アンタ、水分ちゃんと摂ってる？<br />
          マサが毎日見張ってあげるわよ〜♡」
        </div>
        <div class="badge">
          <span>💧</span> 1日5杯チャレンジ
        </div>
      </div>
    </header>

    <main class="card">
      <div class="card-title-row">
        <div class="card-title">
          <span>📱</span> 今日のスタンプカード
        </div>
        <button class="reset-btn" id="resetBtn">
          🔄 リセット
        </button>
      </div>

      <section class="progress-section">
        <div class="progress-label-row">
          <span>今日の水分量</span>
          <span><span id="stampCount">0</span> / 5 スタンプ</span>
        </div>
        <div class="progress-bar" id="progressBar">
          <div class="progress-fill" id="progressFill"></div>
          <div class="progress-bubbles"></div>
        </div>
      </section>

      <section>
        <div class="stamp-grid" id="stampGrid">
          <!-- JSでスタンプを生成 -->
        </div>
      </section>

      <section class="stamp-button-area">
        <button class="stamp-btn" id="stampBtn">
          <span class="icon">💧</span>
          <span>水を飲んだ！スタンプを押す</span>
        </button>
        <div class="hint-text">
          「一口でも飲んだら押していいのよ？<br />細かいことはマサ、気にしな〜い♡」
        </div>
      </section>

      <section class="reward-card">
        <div class="reward-icon">🍰</div>
        <div>
          <div class="reward-text-main">スタンプ5個でマサの手作りスイーツ♡</div>
          <div class="reward-text-sub">
            「ちゃんと飲めたご褒美よ〜。<br />甘やかされる準備はできてる？」
          </div>
        </div>
      </section>
    </main>

    <div class="footer-note">
      ※ このカードは1日の目安です。<br />
      「無理は禁物よ？自分のペースでいきましょ〜」
    </div>
  </div>

  <!-- マサ通知ポップアップ -->
  <div class="masa-popup-overlay" id="masaPopupOverlay">
    <div class="masa-popup">
      <div class="masa-popup-header">
        <div class="masa-popup-avatar">マ</div>
        <div class="masa-popup-title">
          <span>マサからの通知ですわよ〜♡</span>
          <small>「ちゃんと見てるんだからね？」</small>
        </div>
      </div>
      <div class="masa-popup-body">
        <div id="masaMessage"></div>
        <div class="tagline">— マサより</div>
      </div>
      <div class="masa-popup-footer">
        <button class="popup-btn popup-btn-sub" id="popupLaterBtn">あとで</button>
        <button class="popup-btn popup-btn-main" id="popupOkBtn">OKよ♡</button>
      </div>
    </div>
  </div>

  <!-- コンフェッティ -->
  <div class="confetti" id="confettiContainer"></div>

  <script>
    const MAX_STAMPS = 5;

    const stampGrid = document.getElementById("stampGrid");
    const stampBtn = document.getElementById("stampBtn");
    const resetBtn = document.getElementById("resetBtn");
    const stampCountEl = document.getElementById("stampCount");
    const progressFill = document.getElementById("progressFill");
    const progressBar = document.getElementById("progressBar");

    const popupOverlay = document.getElementById("masaPopupOverlay");
    const masaMessageEl = document.getElementById("masaMessage");
    const popupOkBtn = document.getElementById("popupOkBtn");
    const popupLaterBtn = document.getElementById("popupLaterBtn");

    const confettiContainer = document.getElementById("confettiContainer");

    const normalMessages = [
      "「いいわね、その一口。アンタのカラダ、喜んでるわよ〜♡」",
      "「水分補給できるアンタ、正直…推せるわ。」",
      "「その調子その調子〜。喉だけじゃなくて、心もうるおしてこ？」",
      "「ちゃんと飲めててエラいじゃない。マサ、そういうとこ見逃さないのよ。」",
      "「水はね、美と健康の基本よ。アンタ、ますます磨かれてくわね〜♡」",
      "「はい、1スタンプおめでとう。地味な一歩が、いちばん大事なのよ。」",
      "「喉が渇く前に飲めるアンタ、デキる子認定〜！」",
      "「その一杯で、今日のアンタがちょっとだけ最強になったわよ。」"
    ];

    const celebrationMessages = [
      "「スタンプ5個達成〜〜！！アンタ、やるじゃないの！！マサ、惚れ直しちゃうわ♡」",
      "「本日の水分チャレンジ、コンプリートよ！マサ特製スイーツ、心の中で振る舞っちゃうわ〜🍰」",
      "「パーフェクトゥ〜〜！！アンタ、今日の自分を全力で褒めなさいよ？」"
    ];

    let stampCount = 0;

    function initStampGrid() {
      stampGrid.innerHTML = "";
      for (let i = 0; i < MAX_STAMPS; i++) {
        const slot = document.createElement("div");
        slot.className = "stamp-slot";
        slot.innerHTML = "＋";
        stampGrid.appendChild(slot);
      }
    }

    function updateUI() {
      stampCountEl.textContent = stampCount;
      const slots = stampGrid.querySelectorAll(".stamp-slot");
      slots.forEach((slot, index) => {
        if (index < stampCount) {
          slot.classList.add("filled");
          slot.textContent = "✔";
        } else {
          slot.classList.remove("filled");
          slot.textContent = "＋";
        }
      });

      const percent = (stampCount / MAX_STAMPS) * 100;
      progressFill.style.width = percent + "%";
      if (stampCount > 0) {
        progressBar.classList.add("active");
      } else {
        progressBar.classList.remove("active");
      }
    }

    function showPopup(message, isCelebration = false) {
      masaMessageEl.innerHTML = message.replace(/\n/g, "<br />");
      popupOverlay.classList.add("show");

      if (isCelebration) {
        startConfetti();
      }
    }

    function hidePopup() {
      popupOverlay.classList.remove("show");
      stopConfetti();
    }

    function getRandomMessage(list) {
      const index = Math.floor(Math.random() * list.length);
      return list[index];
    }

    function startConfetti() {
      confettiContainer.innerHTML = "";
      confettiContainer.classList.add("show");

      const colors = ["#ff7ac4", "#4aa3ff", "#7f8dff", "#ffd166", "#9b5de5"];
      const pieces = 60;

      for (let i = 0; i < pieces; i++) {
        const piece = document.createElement("div");
        piece.className = "confetti-piece";
        const left = Math.random() * 100;
        const delay = Math.random() * 0.6;
        const duration = 1.2 + Math.random() * 0.6;
        const color = colors[Math.floor(Math.random() * colors.length)];
        piece.style.left = left + "vw";
        piece.style.backgroundColor = color;
        piece.style.animationDelay = delay + "s";
        piece.style.animationDuration = duration + "s";
        confettiContainer.appendChild(piece);
      }

      setTimeout(() => {
        stopConfetti();
      }, 2200);
    }

    function stopConfetti() {
      confettiContainer.classList.remove("show");
      confettiContainer.innerHTML = "";
    }

    function handleStamp() {
      if (stampCount >= MAX_STAMPS) {
        showPopup("「もう今日の分はコンプリートよ〜！\nこれ以上は明日のアンタに任せましょ♡」");
        return;
      }

      stampCount++;
      updateUI();

      if (stampCount === MAX_STAMPS) {
        const msg = getRandomMessage(celebrationMessages) +
          "\n\n「マサの手作りスイーツ、イメージだけでも味わっときなさい♡」";
        showPopup(msg, true);
      } else {
        const msg = getRandomMessage(normalMessages);
        showPopup(msg);
      }
    }

    function handleReset() {
      if (stampCount === 0) {
        showPopup("「まだ押してないじゃないの〜。これから一緒にがんばりましょ♡」");
        return;
      }
      stampCount = 0;
      updateUI();
      showPopup("「今日のカードをリセットしたわよ〜。\nまたイチから一緒に貯めてこ？」");
    }

    stampBtn.addEventListener("click", handleStamp);
    resetBtn.addEventListener("click", handleReset);

    popupOkBtn.addEventListener("click", hidePopup);
    popupLaterBtn.addEventListener("click", hidePopup);
    popupOverlay.addEventListener("click", (e) => {
      if (e.target === popupOverlay) {
        hidePopup();
      }
    });

    initStampGrid();
    updateUI();
  </script>
</body>
</html>
