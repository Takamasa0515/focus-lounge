const time = document.getElementById('time');
const startButton = document.getElementById('start');
const stopButton = document.getElementById('stop');
const endButton = document.getElementById('end');

// 開始時間
let startTime;
// 停止時間（これまでの経過時間）
let stopTime = 0;
// タイマーID
let timeoutID;

// 時間を表示する関数
function displayTime() {
    const elapsed = Date.now() - startTime + stopTime;

    const h = Math.floor(elapsed / 3600000);
    const m = Math.floor((elapsed % 3600000) / 60000);
    const s = Math.floor((elapsed % 60000) / 1000);

    time.textContent =
        String(h).padStart(2, '0') + ':' +
        String(m).padStart(2, '0') + ':' +
        String(s).padStart(2, '0');

    timeoutID = setTimeout(displayTime, 1000);
}

// ▶ start：計測開始
startButton.addEventListener('click', () => {
    startButton.disabled = true;
    stopButton.disabled = false;
    endButton.disabled = false;

    startTime = Date.now();
    displayTime();
});

// ⏸ stop：一時停止
stopButton.addEventListener('click', () => {
    startButton.disabled = false;
    stopButton.disabled = true;
    endButton.disabled = false;

    clearTimeout(timeoutID);
    stopTime += (Date.now() - startTime);
});

// ⏹ end：終了（リセット）
endButton.addEventListener('click', () => {
    clearTimeout(timeoutID);

    startButton.disabled = false;
    stopButton.disabled = true;
    endButton.disabled = true;

    stopTime = 0;
    time.textContent = '00:00:00';
});
