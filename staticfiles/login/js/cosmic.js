/* ===== Fondo cósmico: estrellas, nebulosas, planetas orbitando, estrellas fugaces ===== */
(function () {
    function init() {
        var canvas = document.getElementById('eg-bg');
        if (!canvas || !canvas.getContext) return;
        var ctx = canvas.getContext('2d');
        var w = 0, h = 0;
        var stars = [], shooting = [], planets = [], nebulae = [], particles = [];
        var tick = 0;

        var BLUES = [
            '34,99,184', '58,131,210', '20,72,155',
            '80,160,240', '10,55,120', '100,180,255'
        ];

        function rand(a, b) { return a + Math.random() * (b - a); }
        function randInt(a, b) { return Math.floor(rand(a, b + 1)); }
        function pick(arr) { return arr[Math.floor(Math.random() * arr.length)]; }

        /* ---- Nebulosas ---- */
        function makeNebulae() {
            nebulae = [];
            var count = randInt(4, 7);
            for (var i = 0; i < count; i++) {
                nebulae.push({
                    x: rand(0, w), y: rand(0, h),
                    rx: rand(120, 380), ry: rand(80, 240),
                    hue: randInt(200, 240),
                    a: rand(0.025, 0.065),
                    rot: rand(0, Math.PI)
                });
            }
        }

        /* ---- Planetas ---- */
        function makePlanets() {
            planets = [];
            var count = randInt(3, 6);
            for (var i = 0; i < count; i++) {
                var r = rand(18, 52);
                var orbitR = rand(Math.min(w, h) * 0.22, Math.min(w, h) * 0.78);
                var hasRings = Math.random() < 0.45;
                var hasMoon  = Math.random() < 0.5;
                planets.push({
                    cx: rand(w * 0.15, w * 0.85),
                    cy: rand(h * 0.15, h * 0.85),
                    orbitR: orbitR,
                    angle: rand(0, Math.PI * 2),
                    speed: rand(0.0003, 0.0012) * (Math.random() < 0.5 ? 1 : -1),
                    r: r,
                    colorA: pick(BLUES),
                    colorB: pick(BLUES),
                    a: rand(0.55, 0.95),
                    hasRings: hasRings,
                    ringAngle: rand(-0.4, 0.4),
                    hasMoon: hasMoon,
                    moonAngle: rand(0, Math.PI * 2),
                    moonSpeed: rand(0.008, 0.022) * (Math.random() < 0.5 ? 1 : -1),
                    moonR: rand(4, 9),
                    moonOrbit: rand(r * 1.6, r * 2.8),
                    self: rand(0, Math.PI * 2),   // auto-rotation visual
                    selfSpeed: rand(0.002, 0.008)
                });
            }
        }

        /* ---- Estrellas ---- */
        function makeStars() {
            var count = Math.round((w * h) / 5000);
            count = Math.max(120, Math.min(380, count));
            stars = [];
            for (var i = 0; i < count; i++) {
                stars.push({
                    x: rand(0, w), y: rand(0, h),
                    r: rand(0.4, 2.6),
                    vx: rand(-0.15, 0.15), vy: rand(-0.15, 0.15),
                    a: rand(0.1, 1), ta: rand(0.1, 1),
                    da: rand(0.004, 0.016),
                    blue: pick(BLUES)
                });
            }
        }

        /* ---- Partículas flotantes ---- */
        function makeParticles() {
            particles = [];
            var count = randInt(25, 55);
            for (var i = 0; i < count; i++) {
                particles.push({
                    x: rand(0, w), y: rand(0, h),
                    r: rand(1, 4),
                    vx: rand(-0.4, 0.4), vy: rand(-0.4, 0.4),
                    a: rand(0.05, 0.35),
                    blue: pick(BLUES)
                });
            }
        }

        function resize() {
            w = window.innerWidth;
            h = window.innerHeight;
            var dpr = window.devicePixelRatio || 1;
            canvas.style.width = w + 'px';
            canvas.style.height = h + 'px';
            canvas.width  = Math.floor(w * dpr);
            canvas.height = Math.floor(h * dpr);
            ctx.setTransform(dpr, 0, 0, dpr, 0, 0);
            makeNebulae(); makeStars(); makePlanets(); makeParticles();
        }

        /* ---- Estrella fugaz ---- */
        function spawnShooting() {
            var dir = Math.random() < 0.5 ? 1 : -1;
            var spd = rand(8, 16);
            var ang = rand(0.3, 0.65);
            shooting.push({
                x: dir === 1 ? rand(-60, w * 0.3) : rand(w * 0.7, w + 60),
                y: rand(-60, h * 0.35),
                vx: Math.cos(ang) * spd * dir,
                vy: Math.sin(ang) * spd,
                len: rand(120, 280),
                a: rand(0.7, 1.0),
                w: rand(1.5, 3)
            });
        }

        /* ---- Dibujar nebulosa ---- */
        function drawNebula(n) {
            ctx.save();
            ctx.translate(n.x, n.y);
            ctx.rotate(n.rot);
            var g = ctx.createRadialGradient(0, 0, 0, 0, 0, n.rx);
            g.addColorStop(0,   'hsla(' + n.hue + ',80%,60%,' + n.a + ')');
            g.addColorStop(0.5, 'hsla(' + n.hue + ',70%,50%,' + (n.a * 0.5) + ')');
            g.addColorStop(1,   'hsla(' + n.hue + ',60%,40%,0)');
            ctx.scale(1, n.ry / n.rx);
            ctx.beginPath();
            ctx.arc(0, 0, n.rx, 0, Math.PI * 2);
            ctx.fillStyle = g;
            ctx.fill();
            ctx.restore();
        }

        /* ---- Dibujar planeta ---- */
        function drawPlanet(p) {
            var px = p.cx + Math.cos(p.angle) * p.orbitR * 0;  // posición directa (planetas fijos con luna)
            // planetas orbitan su propio centro ficticio con radio pequeño para dar movimiento sutil
            px = p.cx + Math.cos(p.angle) * (p.r * 0.8);
            var py = p.cy + Math.sin(p.angle) * (p.r * 0.5);

            // sombra suave
            ctx.save();
            ctx.shadowColor = 'rgba(' + p.colorA + ',0.4)';
            ctx.shadowBlur = p.r * 2.5;

            // cuerpo del planeta
            var g = ctx.createRadialGradient(px - p.r * 0.28, py - p.r * 0.28, p.r * 0.1, px, py, p.r);
            g.addColorStop(0,   'rgba(' + p.colorB + ',' + Math.min(1, p.a + 0.2) + ')');
            g.addColorStop(0.6, 'rgba(' + p.colorA + ',' + p.a + ')');
            g.addColorStop(1,   'rgba(' + p.colorA + ',' + (p.a * 0.6) + ')');
            ctx.beginPath();
            ctx.arc(px, py, p.r, 0, Math.PI * 2);
            ctx.fillStyle = g;
            ctx.fill();

            // bandas de superficie
            p.self += p.selfSpeed;
            ctx.globalAlpha = 0.12;
            for (var b = 0; b < 3; b++) {
                var by = py - p.r * 0.5 + b * p.r * 0.4 + Math.sin(p.self + b) * 3;
                ctx.save();
                ctx.beginPath();
                ctx.arc(px, py, p.r, 0, Math.PI * 2);
                ctx.clip();
                ctx.fillStyle = 'rgba(255,255,255,0.15)';
                ctx.fillRect(px - p.r, by - 3, p.r * 2, 5);
                ctx.restore();
            }
            ctx.globalAlpha = 1;
            ctx.shadowBlur = 0;

            // anillos
            if (p.hasRings) {
                ctx.save();
                ctx.translate(px, py);
                ctx.rotate(p.ringAngle);
                var ri = ctx.createLinearGradient(-p.r * 2.1, 0, p.r * 2.1, 0);
                ri.addColorStop(0,   'rgba(' + p.colorA + ',0)');
                ri.addColorStop(0.3, 'rgba(' + p.colorA + ',' + (p.a * 0.45) + ')');
                ri.addColorStop(0.5, 'rgba(' + p.colorB + ',' + (p.a * 0.6) + ')');
                ri.addColorStop(0.7, 'rgba(' + p.colorA + ',' + (p.a * 0.45) + ')');
                ri.addColorStop(1,   'rgba(' + p.colorA + ',0)');
                ctx.strokeStyle = ri;
                ctx.lineWidth = p.r * 0.28;
                ctx.beginPath();
                ctx.ellipse(0, 0, p.r * 2.1, p.r * 0.36, 0, 0, Math.PI * 2);
                ctx.stroke();
                // segundo anillo
                ctx.lineWidth = p.r * 0.12;
                ctx.globalAlpha = 0.35;
                ctx.beginPath();
                ctx.ellipse(0, 0, p.r * 2.6, p.r * 0.44, 0, 0, Math.PI * 2);
                ctx.stroke();
                ctx.globalAlpha = 1;
                ctx.restore();
            }

            // luna
            if (p.hasMoon) {
                p.moonAngle += p.moonSpeed;
                var mx = px + Math.cos(p.moonAngle) * p.moonOrbit;
                var my = py + Math.sin(p.moonAngle) * p.moonOrbit * 0.55;
                ctx.beginPath();
                ctx.arc(mx, my, p.moonR, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + p.colorB + ',' + (p.a * 0.75) + ')';
                ctx.fill();
            }

            ctx.restore();
        }

        /* ---- Loop ---- */
        function draw() {
            tick++;
            ctx.clearRect(0, 0, w, h);

            // nebulosas
            for (var n = 0; n < nebulae.length; n++) drawNebula(nebulae[n]);

            // estrellas
            for (var i = 0; i < stars.length; i++) {
                var s = stars[i];
                s.x += s.vx; s.y += s.vy;
                if (s.x < 0) s.x = w; else if (s.x > w) s.x = 0;
                if (s.y < 0) s.y = h; else if (s.y > h) s.y = 0;
                s.a += (s.a < s.ta ? s.da : -s.da);
                if (Math.abs(s.a - s.ta) < 0.015) s.ta = rand(0.1, 1);
                ctx.beginPath();
                ctx.arc(s.x, s.y, s.r, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + s.blue + ',' + s.a.toFixed(3) + ')';
                ctx.fill();
                // destellos en estrellas grandes
                if (s.r > 1.8 && s.a > 0.7) {
                    ctx.strokeStyle = 'rgba(' + s.blue + ',' + (s.a * 0.4).toFixed(3) + ')';
                    ctx.lineWidth = 0.5;
                    ctx.beginPath(); ctx.moveTo(s.x - s.r * 2.5, s.y); ctx.lineTo(s.x + s.r * 2.5, s.y); ctx.stroke();
                    ctx.beginPath(); ctx.moveTo(s.x, s.y - s.r * 2.5); ctx.lineTo(s.x, s.y + s.r * 2.5); ctx.stroke();
                }
            }

            // partículas flotantes
            for (var k = 0; k < particles.length; k++) {
                var pt = particles[k];
                pt.x += pt.vx; pt.y += pt.vy;
                if (pt.x < 0) pt.x = w; else if (pt.x > w) pt.x = 0;
                if (pt.y < 0) pt.y = h; else if (pt.y > h) pt.y = 0;
                ctx.beginPath();
                ctx.arc(pt.x, pt.y, pt.r, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + pt.blue + ',' + pt.a + ')';
                ctx.fill();
            }

            // planetas
            for (var p = 0; p < planets.length; p++) {
                planets[p].angle += planets[p].speed;
                drawPlanet(planets[p]);
            }

            // estrellas fugaces (más frecuentes)
            if (Math.random() < 0.032 && shooting.length < 5) spawnShooting();
            for (var j = shooting.length - 1; j >= 0; j--) {
                var sh = shooting[j];
                sh.x += sh.vx; sh.y += sh.vy; sh.a -= 0.007;
                var mag = Math.sqrt(sh.vx * sh.vx + sh.vy * sh.vy) || 1;
                var tx = sh.x - (sh.vx / mag) * sh.len;
                var ty = sh.y - (sh.vy / mag) * sh.len;
                var gr = ctx.createLinearGradient(sh.x, sh.y, tx, ty);
                var c = pick(BLUES);
                gr.addColorStop(0, 'rgba(' + c + ',' + Math.max(0, sh.a).toFixed(3) + ')');
                gr.addColorStop(1, 'rgba(' + c + ',0)');
                ctx.strokeStyle = gr;
                ctx.lineWidth = sh.w;
                ctx.lineCap = 'round';
                ctx.beginPath(); ctx.moveTo(sh.x, sh.y); ctx.lineTo(tx, ty); ctx.stroke();
                ctx.beginPath(); ctx.arc(sh.x, sh.y, sh.w * 1.1, 0, Math.PI * 2);
                ctx.fillStyle = 'rgba(' + c + ',' + Math.max(0, sh.a).toFixed(3) + ')';
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
