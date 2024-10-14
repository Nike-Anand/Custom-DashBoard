// your code goes here
const numTrails = 20; // Number of trailing line segments
const trails = [];
const mouse = { x: 0, y: 0 };

// Create multiple trail segments
for (let i = 0; i < numTrails; i++) {
    const div = document.createElement('div');
    div.classList.add('trail');
    document.body.appendChild(div);
    trails.push(div);
}

window.addEventListener('mousemove', function (event) {
    mouse.x = event.pageX;
    mouse.y = event.pageY;
});

function animateTrails() {
    let x = mouse.x;
    let y = mouse.y;

    trails.forEach((trail, index) => {
        const next = trails[index + 1] || trails[0]; // Get next trail segment for smoother transitions

        // Smooth movement with slight lag for the tail effect
        x += (next.offsetLeft - x) * 0.2; // Adjusts to make the movement smoother and slower for tail
        y += (next.offsetTop - y) * 0.2;

        // Set new position and keep the line horizontal
        trail.style.left = x + 'px';
        trail.style.top = y + 'px';
        trail.style.transform = `rotate(0deg)`; // Keep it horizontal
    });

    requestAnimationFrame(animateTrails); // Continuously animate the tail
}

animateTrails();
