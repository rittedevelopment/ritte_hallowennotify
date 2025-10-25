window.addEventListener('message', function(event) {
    if (event.data.action === 'showNotify') {
        showNotification(event.data.message, event.data.duration);
    }
});

function showNotification(message, duration) {
    const container = document.getElementById('notify-container');
    
    //Skapar Notifyen
    const notify = document.createElement('div');
    notify.className = 'halloween-notify';
    
    notify.innerHTML = `
        <div class="notify-content">
            <div class="notify-icon">👻</div>
            <div class="notify-text">${message}</div>
        </div>
    `;
    
    container.appendChild(notify);
    
    // Tas bort efter satt tid
    setTimeout(() => {
        notify.classList.add('hide');
        setTimeout(() => {
            container.removeChild(notify);
        }, 500);
    }, duration);
}