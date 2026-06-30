/* Fondo cósmico: estrellas y estrellas fugaces azules sobre blanco */
(function () {
    function init() {
        var canvas = document.getElementById('eg-bg');
        if (!canvas || !canvas.getContext) return;
        var ctx = canvas.getContext('2d');
        var w = 0, h = 0, dpr = 1;
        var stars = [], shooting = [];
        var BLUE = '34, 99, 184';

        function rand(a, b) { return a + Math.random() * (b - a); }

        function resize() {
            dpr = window.devicePixelRatio || 1;
            w = window.innerWidth;
            h = window.innerHeight;
            canvas.style.width = w + 'px';
            canvas.style.height = h + 'px';
            canvas.width = Math.floor(w * dpr);
            canvas.height = Math.floor(h * dpr);
            ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
            makeStars();
        }

        function makeStars() {
            var count = Math.round((w * h) / 9000);
            count = Math.max(60, Math.min(200, count));
            stars = [];
            for (var i = 0; i < count; i++) {
                stars.push({
                    x: rand(0, w), y: rand(0, h),
                    r: rand(0.5, 2.1),
                    vx: rand(-0.12, 0.12), vy: rand(-0.12, 0.12),
                    a: rand(0.15, 0.85), ta: rand(0.15, 0.85), da: rand(0.003, 0.012)
                });
            }
        }

        function spawnShooting() {
            var dir = Math.random() < 0.5 ? 1 : -1;
            var speed = rand(7, 12);
            var ang = rand(0.35, 0.6); // hacia abajo
            shooting.push({
                x: dir === 1 ? rand(-40, w * 0.4) : rand(w * 0.6, w + 40),
                y: rand(-40, h * 0.4),
                vx: Math.cos(ang) * speed * dir,
                vy: Math.sin(ang) * speed,
                len: rand(140, 240),
                a: 1
            });
        }

        function draw() {
            ctx.clearRect(0, 0, w, h);

            // estrellas
            for (var i = 0; i < stars.length; i++) {
                var s = stars[i];
                s.x += s.vx; s.y += s.vy;
                if (s.x < 0) s.x = w; else if (s.x > w) s.x = 0;
                if (s.y < 0) s.y = h; else if (s.y > h) s.y = 0;
                s.a += (s.a < s.ta ? s.da : -s.da);
                if (Math.abs(s.a - s.ta) < 0.02) s.ta = rand(0.15, 0.85);
                ctx.beginPath();
                ctx.arc(s.x, s.y, s.r, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + BLUE + ',' + s.a.toFixed(3) + ')';
                ctx.fill();
            }

            // estrellas fugaces
            if (Math.random() < 0.018 && shooting.length < 3) spawnShooting();
            for (var j = shooting.length - 1; j >= 0; j--) {
                var sh = shooting[j];
                sh.x += sh.vx; sh.y += sh.vy; sh.a -= 0.006;
                var mag = Math.sqrt(sh.vx * sh.vx + sh.vy * sh.vy) || 1;
                var tx = sh.x - (sh.vx / mag) * sh.len;
                var ty = sh.y - (sh.vy / mag) * sh.len;
                var grad = ctx.createLinearGradient(sh.x, sh.y, tx, ty);
                grad.addColorStop(0, 'rgba(' + BLUE + ',' + Math.max(0, sh.a).toFixed(3) + ')');
                grad.addColorStop(1, 'rgba(' + BLUE + ',0)');
                ctx.strokeStyle = grad;
                ctx.lineWidth = 2;
                ctx.lineCap = 'round';
                ctx.beginPath();
                ctx.moveTo(sh.x, sh.y);
                ctx.lineTo(tx, ty);
                ctx.stroke();
                // cabeza brillante
                ctx.beginPath();
                ctx.arc(sh.x, sh.y, 1.8, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + BLUE + ',' + Math.max(0, sh.a).toFixed(3) + ')';
                ctx.fill();
                if (sh.a <= 0 || sh.x < -sh.len || sh.x > w + sh.len || sh.y > h + sh.len) {
                    shooting.splice(j, 1);
                }
            }

            requestAnimationFrame(draw);
        }

        window.addEventListener('resize', resize);
        resize();
        requestAnimationFrame(draw);
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
})();
