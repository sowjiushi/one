<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>VibeStore — modern commerce</title>

    <!-- Fonts & Icons -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Plus+Jakarta+Sans:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        :root {
            --bg: #faf9f6;
            --surface: #ffffff;
            --card-bg: #ffffff;
            --primary: #1e1e2f;
            --accent: #f9736b;
            --accent-soft: #fee2e1;
            --muted: #6b6b7b;
            --border-light: #efedec;
            --shadow-sm: 0 8px 24px rgba(0, 0, 0, 0.02), 0 2px 6px rgba(0, 0, 0, 0.02);
            --shadow-hover: 0 24px 48px -12px rgba(0, 0, 0, 0.08);
            --radius-card: 20px;
            --radius-pill: 100px;
            --container: 1240px;
            --font: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: var(--font);
            background: var(--bg);
            color: var(--primary);
            line-height: 1.5;
            -webkit-font-smoothing: antialiased;
        }

        .container {
            max-width: var(--container);
            margin: 0 auto;
            padding: 0 24px;
        }

        /* ---- header ---- */
        header {
            position: sticky;
            top: 0;
            z-index: 50;
            background: rgba(255, 255, 255, 0.78);
            backdrop-filter: blur(16px) saturate(180%);
            -webkit-backdrop-filter: blur(16px) saturate(180%);
            border-bottom: 1px solid rgba(0, 0, 0, 0.02);
        }

        .header-inner {
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 16px;
            padding: 14px 0;
        }

        .brand {
            font-weight: 800;
            font-size: 22px;
            letter-spacing: -0.02em;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .brand span {
            background: linear-gradient(145deg, var(--accent), #e85d4a);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .mobile-toggle {
            display: none;
            background: none;
            border: 0;
            font-size: 22px;
            color: var(--primary);
            cursor: pointer;
        }

        nav.main-nav ul {
            display: flex;
            gap: 4px;
            list-style: none;
        }
        nav.main-nav li a {
            display: flex;
            align-items: center;
            gap: 8px;
            padding: 8px 16px;
            border-radius: 40px;
            font-weight: 600;
            color: var(--primary);
            transition: 0.15s ease;
            font-size: 14px;
        }
        nav.main-nav li a i {
            font-size: 15px;
            opacity: 0.7;
        }
        nav.main-nav li a:hover {
            background: var(--accent-soft);
            color: var(--accent);
        }

        .search-wrap {
            display: flex;
            align-items: center;
            background: white;
            border: 1px solid var(--border-light);
            border-radius: 60px;
            padding: 4px 4px 4px 18px;
            min-width: 220px;
            transition: 0.2s;
            box-shadow: var(--shadow-sm);
        }
        .search-wrap:focus-within {
            border-color: var(--accent);
            box-shadow: 0 0 0 4px rgba(249, 115, 107, 0.08);
        }
        .search-wrap input {
            border: 0;
            background: transparent;
            outline: none;
            width: 100%;
            font-size: 14px;
            padding: 8px 0;
        }
        .search-wrap button {
            background: var(--accent);
            border: 0;
            color: white;
            padding: 8px 16px;
            border-radius: 40px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
            font-size: 14px;
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .search-wrap button:hover {
            background: #e55a4a;
        }

        .header-actions {
            display: flex;
            align-items: center;
            gap: 6px;
        }
        .icon-btn {
            background: transparent;
            border: 0;
            width: 44px;
            height: 44px;
            border-radius: 40px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            color: var(--primary);
            transition: 0.15s;
            cursor: pointer;
        }
        .icon-btn:hover {
            background: var(--accent-soft);
            color: var(--accent);
        }

        .cart {
            position: relative;
            display: flex;
            align-items: center;
            gap: 4px;
            padding: 4px 14px 4px 10px;
            border-radius: 40px;
            background: var(--surface);
            border: 1px solid var(--border-light);
            box-shadow: var(--shadow-sm);
            text-decoration: none;
            color: var(--primary);
            font-weight: 600;
        }
        .cart-count {
            background: var(--accent);
            color: white;
            font-size: 11px;
            font-weight: 700;
            min-width: 22px;
            height: 22px;
            border-radius: 40px;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            margin-left: 4px;
        }

        /* mobile menu */
        #mobileMenu {
            display: none;
            background: white;
            padding: 12px 0 18px;
            border-top: 1px solid var(--border-light);
        }
        #mobileMenu ul {
            display: flex;
            flex-direction: column;
            gap: 6px;
            list-style: none;
        }
        #mobileMenu ul a {
            display: block;
            padding: 12px 16px;
            font-weight: 600;
            border-radius: 14px;
            transition: 0.1s;
        }
        #mobileMenu ul a:hover {
            background: var(--accent-soft);
        }

        /* hero */
        .hero {
            background: linear-gradient(145deg, #1e1e2f 0%, #2b2b42 100%);
            color: white;
            border-radius: 32px;
            margin: 24px auto 0;
            padding: 64px 48px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
            justify-content: space-between;
            position: relative;
            overflow: hidden;
            box-shadow: 0 20px 40px -12px rgba(0, 0, 0, 0.2);
        }
        .hero::after {
            content: '';
            position: absolute;
            right: -20%;
            bottom: -40%;
            width: 500px;
            height: 500px;
            background: radial-gradient(circle, rgba(249, 115, 107, 0.15) 0%, transparent 70%);
            pointer-events: none;
        }
        .hero-content {
            flex: 1 1 300px;
            z-index: 2;
        }
        .hero h1 {
            font-size: 44px;
            font-weight: 800;
            letter-spacing: -0.02em;
            line-height: 1.2;
        }
        .hero h1 i {
            color: var(--accent);
        }
        .hero p {
            font-size: 18px;
            opacity: 0.8;
            max-width: 480px;
            margin: 16px 0 28px;
            font-weight: 400;
        }
        .hero .btn-group {
            display: flex;
            flex-wrap: wrap;
            gap: 12px;
        }
        .btn {
            display: inline-flex;
            align-items: center;
            gap: 10px;
            padding: 14px 28px;
            border-radius: 60px;
            font-weight: 700;
            border: 0;
            cursor: pointer;
            transition: 0.2s;
            font-size: 15px;
        }
        .btn-primary {
            background: var(--accent);
            color: white;
            box-shadow: 0 8px 24px rgba(249, 115, 107, 0.25);
        }
        .btn-primary:hover {
            transform: scale(1.02);
            background: #e85d4a;
        }
        .btn-ghost {
            background: rgba(255, 255, 255, 0.06);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(255, 255, 255, 0.08);
            color: white;
        }
        .btn-ghost:hover {
            background: rgba(255, 255, 255, 0.12);
        }
        .hero-badge {
            background: rgba(255, 255, 255, 0.04);
            backdrop-filter: blur(4px);
            padding: 6px 16px;
            border-radius: 60px;
            font-size: 13px;
            border: 1px solid rgba(255, 255, 255, 0.04);
            display: inline-block;
            margin-bottom: 12px;
        }

        /* sections */
        .section {
            padding: 48px 0;
        }
        .section-header {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 24px;
        }
        .section-header h2 {
            font-size: 28px;
            font-weight: 700;
            letter-spacing: -0.01em;
        }
        .section-header p {
            color: var(--muted);
            font-size: 15px;
        }

        /* categories */
        .categories-grid {
            display: grid;
            grid-template-columns: repeat(6, 1fr);
            gap: 16px;
        }
        .cat-card {
            background: var(--surface);
            border-radius: 20px;
            padding: 20px 10px;
            text-align: center;
            box-shadow: var(--shadow-sm);
            border: 1px solid rgba(0, 0, 0, 0.01);
            transition: all 0.2s;
            cursor: pointer;
        }
        .cat-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-hover);
            border-color: var(--accent-soft);
        }
        .cat-card .icon {
            font-size: 30px;
            color: var(--accent);
            margin-bottom: 8px;
            display: inline-block;
            background: var(--accent-soft);
            width: 60px;
            height: 60px;
            line-height: 60px;
            border-radius: 40px;
        }
        .cat-card h4 {
            font-weight: 700;
            font-size: 15px;
            margin-top: 8px;
        }
        .cat-card .sub {
            font-size: 12px;
            color: var(--muted);
            margin-top: 4px;
        }

        /* products */
        .products-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 24px;
        }
        .product-card {
            background: var(--card-bg);
            border-radius: var(--radius-card);
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            transition: 0.2s;
            border: 1px solid rgba(0, 0, 0, 0.02);
            display: flex;
            flex-direction: column;
        }
        .product-card:hover {
            transform: translateY(-6px);
            box-shadow: var(--shadow-hover);
        }
        .product-card .img-wrap {
            position: relative;
            background: #f4f3f0;
            height: 200px;
            overflow: hidden;
        }
        .product-card .img-wrap img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .product-card .badge {
            position: absolute;
            top: 12px;
            left: 12px;
            background: var(--accent);
            color: white;
            font-weight: 700;
            font-size: 11px;
            padding: 4px 12px;
            border-radius: 40px;
        }
        .product-body {
            padding: 16px 16px 12px;
            flex: 1;
        }
        .product-body h5 {
            font-size: 16px;
            font-weight: 700;
        }
        .product-body .category {
            font-size: 13px;
            color: var(--muted);
            text-transform: capitalize;
        }
        .product-body .price-row {
            display: flex;
            align-items: center;
            gap: 8px;
            margin-top: 8px;
        }
        .product-body .price {
            font-weight: 800;
            font-size: 18px;
        }
        .product-body .old-price {
            color: var(--muted);
            text-decoration: line-through;
            font-weight: 500;
            font-size: 14px;
        }
        .product-body .rating {
            color: #fbbf24;
            font-size: 13px;
            display: flex;
            align-items: center;
            gap: 4px;
        }
        .product-footer {
            padding: 8px 16px 16px;
            display: flex;
            gap: 10px;
        }
        .add-btn {
            flex: 1;
            background: var(--primary);
            color: white;
            border: 0;
            padding: 12px;
            border-radius: 60px;
            font-weight: 700;
            cursor: pointer;
            transition: 0.15s;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }
        .add-btn:hover {
            background: var(--accent);
        }
        .wish-btn {
            background: var(--bg);
            border: 1px solid var(--border-light);
            width: 48px;
            border-radius: 60px;
            cursor: pointer;
            transition: 0.15s;
        }
        .wish-btn:hover {
            background: var(--accent-soft);
        }

        /* deal */
        .deal-card {
            display: flex;
            flex-wrap: wrap;
            background: white;
            border-radius: 28px;
            overflow: hidden;
            box-shadow: var(--shadow-sm);
            border: 1px solid rgba(0, 0, 0, 0.02);
        }
        .deal-card img {
            width: 45%;
            object-fit: cover;
            height: 300px;
            flex: 1 1 200px;
        }
        .deal-content {
            flex: 1 1 280px;
            padding: 32px 32px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }
        .deal-content h3 {
            font-size: 28px;
            font-weight: 800;
        }
        .deal-content .timer {
            display: flex;
            gap: 12px;
            margin: 18px 0;
        }
        .deal-content .time-box {
            background: var(--primary);
            color: white;
            padding: 10px 12px;
            border-radius: 16px;
            min-width: 64px;
            text-align: center;
        }
        .deal-content .time-box div:first-child {
            font-size: 24px;
            font-weight: 700;
        }
        .deal-content .time-box div:last-child {
            font-size: 11px;
            opacity: 0.7;
        }
        .deal-content .price-big {
            font-size: 32px;
            font-weight: 800;
        }
        .deal-content .discount-tag {
            background: #f9736b;
            color: white;
            padding: 4px 14px;
            border-radius: 40px;
            font-weight: 700;
            font-size: 14px;
            display: inline-block;
        }

        /* testimonials */
        .testimonials-scroll {
            display: flex;
            gap: 20px;
            overflow-x: auto;
            padding: 8px 2px 16px;
        }
        .testimonial-card {
            min-width: 300px;
            background: white;
            padding: 24px;
            border-radius: 24px;
            box-shadow: var(--shadow-sm);
            border: 1px solid var(--border-light);
        }
        .testimonial-card .stars {
            color: #fbbf24;
            margin-bottom: 8px;
        }

        /* newsletter */
        .newsletter-box {
            background: var(--primary);
            color: white;
            border-radius: 32px;
            padding: 48px 32px;
            text-align: center;
        }
        .newsletter-box h3 {
            font-size: 28px;
            font-weight: 700;
        }
        .newsletter-box .form-wrap {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
            margin-top: 20px;
        }
        .newsletter-box input {
            padding: 16px 20px;
            border-radius: 60px;
            border: 0;
            min-width: 280px;
            font-size: 15px;
            background: rgba(255, 255, 255, 0.06);
            color: white;
            border: 1px solid rgba(255, 255, 255, 0.08);
        }
        .newsletter-box input::placeholder {
            color: rgba(255, 255, 255, 0.5);
        }
        .newsletter-box input:focus {
            outline: none;
            background: rgba(255, 255, 255, 0.08);
        }
        .newsletter-box .btn-primary {
            background: var(--accent);
            color: white;
        }

        /* footer */
        footer {
            padding: 40px 0 24px;
            border-top: 1px solid var(--border-light);
            color: var(--muted);
            font-size: 14px;
        }
        .footer-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-between;
            gap: 32px;
        }
        .footer-grid .brand {
            font-size: 20px;
        }
        .footer-links {
            display: flex;
            gap: 48px;
        }
        .footer-links div {
            display: flex;
            flex-direction: column;
            gap: 8px;
        }
        .footer-links div strong {
            color: var(--primary);
            font-weight: 700;
        }

        /* responsive */
        @media (max-width: 1024px) {
            .categories-grid {
                grid-template-columns: repeat(3, 1fr);
            }
            .products-grid {
                grid-template-columns: repeat(3, 1fr);
            }
        }
        @media (max-width: 820px) {
            nav.main-nav {
                display: none;
            }
            .mobile-toggle {
                display: inline-block;
            }
            .search-wrap {
                min-width: 140px;
            }
            .products-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .categories-grid {
                grid-template-columns: repeat(2, 1fr);
            }
            .hero h1 {
                font-size: 34px;
            }
            .deal-card img {
                width: 100%;
                height: 200px;
            }
        }
        @media (max-width: 540px) {
            .container {
                padding: 0 16px;
            }
            .hero {
                padding: 40px 24px;
                border-radius: 24px;
            }
            .hero h1 {
                font-size: 28px;
            }
            .products-grid {
                grid-template-columns: 1fr;
            }
            .categories-grid {
                grid-template-columns: 1fr 1fr;
            }
            .search-wrap input {
                font-size: 13px;
            }
            .search-wrap button span {
                display: none;
            }
            .footer-links {
                flex-direction: column;
                gap: 16px;
            }
            .footer-grid {
                flex-direction: column;
            }
        }
    </style>
</head>
<body>
    <header>
        <div class="container header-inner">
            <div style="display:flex;align-items:center;gap:12px;">
                <button class="mobile-toggle" id="mobileToggle" aria-label="Menu"><i class="fas fa-bars"></i></button>
                <a class="brand" href="#"><i class="fas fa-store-alt" style="background:linear-gradient(145deg,var(--accent),#e85d4a);-webkit-background-clip:text;-webkit-text-fill-color:transparent;"></i> Vibe<span>Store</span></a>
            </div>

            <nav class="main-nav" id="mainNav">
                <ul>
                    <li><a href="#"><i class="fas fa-compass"></i> Discover</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#deals"><i class="fas fa-bolt"></i> Flash</a></li>
                    <li><a href="#"><i class="fas fa-fire"></i> Trending</a></li>
                </ul>
            </nav>

            <div style="display:flex;align-items:center;gap:12px;">
                <div class="search-wrap">
                    <input type="text" id="searchInput" placeholder="Search items..." aria-label="Search">
                    <button id="searchBtn"><i class="fas fa-search"></i> <span>Search</span></button>
                </div>
                <div class="header-actions">
                    <a class="icon-btn" href="#" aria-label="Account"><i class="far fa-user"></i></a>
                    <a class="icon-btn" href="#" aria-label="Wishlist"><i class="far fa-heart"></i></a>
                    <a class="cart" href="#" id="cartBtn">
                        <i class="fas fa-shopping-bag"></i>
                        <span class="cart-count" id="cartCount">0</span>
                    </a>
                </div>
            </div>
        </div>

        <!-- mobile -->
        <div id="mobileMenu">
            <div class="container">
                <ul>
                    <li><a href="#"><i class="fas fa-compass"></i> Discover</a></li>
                    <li><a href="#categories"><i class="fas fa-th-large"></i> Categories</a></li>
                    <li><a href="#deals"><i class="fas fa-bolt"></i> Flash</a></li>
                    <li><a href="#"><i class="fas fa-fire"></i> Trending</a></li>
                </ul>
            </div>
        </div>
    </header>

    <main>
        <!-- hero -->
        <section class="container hero">
            <div class="hero-content">
                <div class="hero-badge"><i class="fas fa-sparkles"></i> new drop · limited</div>
                <h1>Fresh finds <br/>for your <i>vibe</i></h1>
                <p>Discover curated picks from fashion to tech — handpicked for the modern you.</p>
                <div class="btn-group">
                    <button class="btn btn-primary" id="shopNow"><i class="fas fa-arrow-right"></i> Explore</button>
                    <button class="btn btn-ghost" id="exploreDeals"><i class="fas fa-tag"></i> Deals</button>
                </div>
            </div>
            <div style="z-index:2;font-size:120px;opacity:0.08;font-weight:800;letter-spacing:-0.08em;pointer-events:none;user-select:none;">✦</div>
        </section>

        <!-- categories -->
        <section id="categories" class="section container">
            <div class="section-header">
                <div><h2>Shop by category</h2><p style="color:var(--muted);">find what you love</p></div>
            </div>
            <div class="categories-grid" id="categoriesGrid" aria-live="polite"></div>
        </section>

        <!-- products -->
        <section class="section container">
            <div class="section-header">
                <div><h2>Trending now</h2><p style="color:var(--muted);">popular picks</p></div>
            </div>
            <div class="products-grid" id="productsGrid" aria-live="polite"></div>
        </section>

        <!-- deal -->
        <section id="deals" class="section container">
            <div class="section-header">
                <div><h2>Flash sale</h2><p style="color:var(--muted);">don't blink</p></div>
            </div>
            <div class="deal-card">
                <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80" alt="deal">
                <div class="deal-content">
                    <h3>MacBook Air M2</h3>
                    <p style="color:var(--muted);margin:4px 0 8px;">thin, light, powerful</p>
                    <div class="timer">
                        <div class="time-box"><div id="dealDays">0</div><div>days</div></div>
                        <div class="time-box"><div id="dealHours">00</div><div>hrs</div></div>
                        <div class="time-box"><div id="dealMinutes">00</div><div>min</div></div>
                        <div class="time-box"><div id="dealSeconds">00</div><div>sec</div></div>
                    </div>
                    <div style="display:flex;align-items:center;gap:16px;flex-wrap:wrap;">
                        <span class="price-big">$999</span>
                        <span style="text-decoration:line-through;color:var(--muted);font-weight:500;">$1,199</span>
                        <span class="discount-tag">-17%</span>
                    </div>
                    <div style="margin-top:16px;"><button class="btn btn-primary" id="buyDeal"><i class="fas fa-bolt"></i> Grab deal</button></div>
                </div>
            </div>
        </section>

        <!-- testimonials -->
        <section class="section container">
            <div class="section-header"><div><h2>Real voices</h2><p style="color:var(--muted);">from our community</p></div></div>
            <div class="testimonials-scroll">
                <div class="testimonial-card"><div class="stars">★★★★★</div><p style="margin:6px 0;">"Absolutely love the curation — found my new favorite bag!"</p><div style="font-weight:700;">— Ava</div></div>
                <div class="testimonial-card"><div class="stars">★★★★☆</div><p style="margin:6px 0;">"Smooth checkout and fast delivery. The packaging was beautiful."</p><div style="font-weight:700;">— Michael</div></div>
                <div class="testimonial-card"><div class="stars">★★★★★</div><p style="margin:6px 0;">"Finally a store that feels modern and easy to browse."</p><div style="font-weight:700;">— Nina</div></div>
            </div>
        </section>

        <!-- newsletter -->
        <section class="section container">
            <div class="newsletter-box">
                <h3><i class="fas fa-envelope" style="margin-right:10px;"></i> Stay in the loop</h3>
                <p style="opacity:0.7;margin-top:6px;">Get first dibs on drops & exclusive deals.</p>
                <div class="form-wrap">
                    <input type="email" id="newsletterEmail" placeholder="your@email.com">
                    <button class="btn btn-primary" id="subscribeBtn"><i class="fas fa-paper-plane"></i> Subscribe</button>
                </div>
                <div id="newsletterMsg" style="margin-top:12px;font-size:14px;display:none;"></div>
            </div>
        </section>
    </main>

    <footer>
        <div class="container footer-grid">
            <div><div class="brand"><i class="fas fa-store-alt" style="background:linear-gradient(145deg,var(--accent),#e85d4a);-webkit-background-clip:text;-webkit-text-fill-color:transparent;"></i> VibeStore</div><p style="margin-top:6px;max-width:280px;">A fresh take on e‑commerce — built for discovery.</p></div>
            <div class="footer-links">
                <div><strong>Explore</strong><a href="#">New arrivals</a><a href="#">Best sellers</a><a href="#">Gift guides</a></div>
                <div><strong>Support</strong><a href="#">Help center</a><a href="#">Returns</a><a href="#">Contact</a></div>
            </div>
        </div>
        <div style="text-align:center;margin-top:28px;color:var(--muted);font-size:13px;">© <span id="year"></span> VibeStore · made with <i class="fas fa-heart" style="color:var(--accent);"></i></div>
    </footer>

    <script>
        // ---- data ----
        const CATEGORIES = [
            { id: 'phones', name: 'Phones', icon: 'fa-mobile-alt' },
            { id: 'laptops', name: 'Laptops', icon: 'fa-laptop' },
            { id: 'clothing', name: 'Clothing', icon: 'fa-tshirt' },
            { id: 'gadgets', name: 'Gadgets', icon: 'fa-headphones' },
            { id: 'footwear', name: 'Footwear', icon: 'fa-shoe-prints' },
            { id: 'accessories', name: 'Accessories', icon: 'fa-watch' }
        ];
        const PRODUCTS = [
            { id:1, title:'iPhone 14 Pro Max', price:1099, oldPrice:1199, rating:5, reviews:128, badge:'New', img:'https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80', category:'phones' },
            { id:2, title:'MacBook Pro 14"', price:1999, rating:4, reviews:86, img:'https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80', category:'laptops' },
            { id:3, title:'Apple Watch S8', price:349, oldPrice:399, rating:5, reviews:214, badge:'-25%', img:'https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
            { id:4, title:'Nike Air Max 270', price:150, rating:4, reviews:53, img:'https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80', category:'footwear' },
            { id:5, title:'Sony A7 IV', price:2499, rating:5, reviews:42, img:'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80', category:'gadgets' },
            { id:6, title:'Chanel No.5', price:120, rating:5, reviews:189, img:'https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80', category:'accessories' },
            { id:7, title:'Travel Backpack', price:79, oldPrice:99, rating:4, reviews:67, img:'https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80', category:'accessories' },
            { id:8, title:'Sony WH-1000XM5', price:399, rating:5, reviews:156, img:'https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80', category:'gadgets' }
        ];

        const categoriesGrid = document.getElementById('categoriesGrid');
        const productsGrid = document.getElementById('productsGrid');
        const cartCountEl = document.getElementById('cartCount');
        const searchInput = document.getElementById('searchInput');
        let cartCount = 0;

        function renderCategories() {
            categoriesGrid.innerHTML = '';
            CATEGORIES.forEach(cat => {
                const el = document.createElement('div');
                el.className = 'cat-card';
                el.innerHTML = `<div class="icon"><i class="fas ${cat.icon}"></i></div><h4>${cat.name}</h4><div class="sub">explore</div>`;
                el.addEventListener('click', () => { searchInput.value = cat.name; filterProducts(cat.name); });
                categoriesGrid.appendChild(el);
            });
        }

        function renderProducts(list) {
            productsGrid.innerHTML = '';
            list.forEach(p => {
                const el = document.createElement('article');
                el.className = 'product-card';
                el.innerHTML = `
                    <div class="img-wrap">
                        ${p.badge ? `<span class="badge">${p.badge}</span>` : ''}
                        <img src="${p.img}" alt="${p.title}"
