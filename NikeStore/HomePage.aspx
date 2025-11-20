<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="HomePage.aspx.cs" Inherits="NikeStore.HomePage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600;700;800&display=swap" rel="stylesheet" />

    <style>
        body {
            opacity: 0;
            animation: pageFadeIn 1.5s ease-in-out forwards;
        }
        @keyframes pageFadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        /* ===== HERO VIDEO SECTION (80% full screen) ===== */
        .hero-section {
            position: relative;
            width: 100%;
            height: 80vh; / fills 80% of screen */
            overflow: hidden;
        }
        .hero-video {
            width: 100%;
            height: 100%;
            object-fit: cover;
            filter: brightness(60%);
            transform: scale(1.05);
            animation: zoomIn 6s ease-in-out forwards;
        }
        @keyframes zoomIn {
            0% { transform: scale(1.1); opacity: 0; }
            100% { transform: scale(1.05); opacity: 1; }
        }

        .hero-text {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            color: white;
            text-align: center;
            opacity: 0;
            animation: fadeInText 2.5s ease-in-out forwards;
            animation-delay: 0.5s;
        }
        @keyframes fadeInText {
            from { opacity: 0; transform: translate(-50%, -45%); }
            to { opacity: 1; transform: translate(-50%, -50%); }
        }
        .hero-text h1 {
            font-size: 3.8em;
            font-weight: 800;
            letter-spacing: 1px;
            text-shadow: 0 4px 20px rgba(0,0,0,0.5);
        }
        .hero-text p {
            font-size: 1.4em;
            font-weight: 500;
            margin-top: 10px;
        }



        /* ===== CATEGORY SECTION (RECTANGULAR DESIGN) ===== */
        .category-section {
            text-align: center;
            padding: 80px 5%;
        }
        .category-section h2 {
            font-size: 2.5em;
            font-weight: 700;
            margin-bottom: 50px;
        }
        .category-grid {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
        }
        .category-card {
            flex: 1 1 300px;
            min-width: 280px;
            background: #fff;
            border-radius: 15px;
            overflow: hidden;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 6px 20px rgba(0,0,0,0.1);
        }
        .category-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 10px 30px rgba(0,0,0,0.15);
        }
        .category-card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
        }
        .category-card h3 {
            margin-top: 20px;
            font-size: 1.3em;
            font-weight: 600;
        }
        .category-card a {
            display: inline-block;
            margin: 15px 0 25px;
            padding: 8px 20px;
            border: 2px solid #111;
            border-radius: 30px;
            color: #111;
            text-decoration: none;
            transition: all 0.3s ease;
        }
        .category-card a:hover {
            background: #111;
            color: #fff;
        }

        /* ===== RELEASING SOON SECTION ===== */
        .release-section {
            padding: 80px 8%;
            background: #f8f8f8;
            text-align: center;
        }
        .release-section h2 {
            font-size: 2.3em;
            font-weight: 700;
            margin-bottom: 50px;
        }
        .release-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 25px;
        }
        .release-item {
            position: relative;
            overflow: hidden;
            border-radius: 20px;
        }
        .release-item img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .release-item:hover img {
            transform: scale(1.1);
            filter: brightness(80%);
        }
        .release-item span {
            position: absolute;
            bottom: 15px;
            left: 20px;
            color: #fff;
            font-weight: 600;
            background: rgba(0,0,0,0.5);
            padding: 6px 12px;
            border-radius: 6px;
        }

        /* ===== INFO SECTION ===== */
        .info-section {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 40px;
            flex-wrap: wrap;
            padding: 80px 8%;
            background: #fff;
        }
        .info-card {
            flex: 1 1 450px;
            background: white;
            border-radius: 20px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        .info-card:hover {
            transform: translateY(-5px);
        }
        .info-card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
        }
        .info-content {
            padding: 25px;
        }
        .info-content h2 {
            font-size: 2em;
            margin-bottom: 10px;
        }
        .info-content p {
            color: #555;
        }

        /* ===== SERVICES SECTION ===== */
        .services-section {
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
            padding: 60px 5%;
            background: #111;
            color: white;
            text-align: center;
        }
        .service-box {
            flex: 1 1 220px;
            margin: 15px;
        }
        .service-box i {
            font-size: 2.2em;
            margin-bottom: 15px;
            color: #ff5a5f;
        }
        .service-box h4 {
            font-weight: 600;
            margin-bottom: 8px;
        }
        .service-box p {
            font-size: 0.95em;
            color: #ccc;
        }


        .scrolling-wrapper { overflow: hidden; width: 100%; background: linear-gradient(180deg, #f8f8f8, #ececec); margin-top: 60px; padding: 40px 0; } .scrolling-row { display: flex; width: max-content; /* important for flexible width */ animation: scrollLeft 40s linear infinite; } .scrolling-row.reverse { animation: scrollRight 40s linear infinite; } .scrolling-row img { width: 220px; height: 140px; object-fit: cover; border-radius: 15px; margin: 0 10px; box-shadow: 0 3px 6px rgba(0,0,0,0.15); } /* scroll animations */ @keyframes scrollLeft { 0% { transform: translateX(0); } 100% { transform: translateX(-50%); } } @keyframes scrollRight { 0% { transform: translateX(-50%); } 100% { transform: translateX(0); } } @keyframes scrollLeft { 0% { transform: translateX(0); } 100% { transform: translateX(-50%); } } @keyframes scrollRight { 0% { transform: translateX(-50%); } 100% { transform: translateX(0); } }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- HERO VIDEO -->
   <div class="hero-section">
        <video class="hero-video" autoplay muted loop>
            <source src="images/Nike Logo Animation  Motion Graphics  2D Animation  Motionalistic - Pooja Jain (1080p, h264, youtube).mp4" type="video/mp4" />
        </video>
        <div class="hero-text">
            <h1>Welcome to Our Store</h1>
            <p>Step into the future of footwear and fashion.</p>
        </div>
    </div>

    <!-- SHOP BY CATEGORY -->
    <section class="category-section">
        <h2>Shop by Category</h2>
        <div class="category-grid">
            <div class="category-card" style="background:#b4f971;">
                <img src="images/Men Collections.jpg" alt="Men Collection" />
                <h3>Men Collections</h3>
                <a href="#">Explore All →</a>
            </div>
            <div class="category-card" style="background:#f7b8f4;">
                <img src="images/weman Collections.jpg" alt="Women Collection" />
                <h3>Women Collections</h3>
                <a href="#">Explore All →</a>
            </div>
            <div class="category-card" style="background:#ffbdbd;">
                <img src="images/DD nike MGym.png" alt="Sports Collection" />
                <h3>Sports Collections</h3>
                <a href="#">Explore All →</a>
            </div>
        </div>
    </section>

    <!-- RELEASING SOON -->
    <section class="release-section">
        <h2>Releasing Soon</h2>
        <div class="release-grid">
            <div class="release-item">
                <img src="images/Nike Zoom.jpg" alt="Shoe 1" />
                <span>Nike Zoom</span>
            </div>
            <div class="release-item">
                <img src="images/Air Max 2025.jpg" alt="Shoe 2" />
                <span>Air Max 2025</span>
            </div>
            <div class="release-item">
                <img src="images/React Phantom.jpg" alt="Shoe 3" />
                <span>React Phantom</span>
            </div>
            <div class="release-item">
                <img src="images/Jordan Elite.jpeg" alt="Shoe 4" />
                <span>Jordan Elite</span>
            </div>
        </div>
    </section>

    <!-- INFO SECTION -->
    <section class="info-section">
        <div class="info-card">
            <img src="images/store-team.jpg" alt="Team" />
            <div class="info-content">
                <h2>Build stores for others</h2>
                <p>Find, organize and protect your work with Nike.</p>
                <a href="#">Join the movement</a>
            </div>
        </div>
        <div class="info-card">
            <img src="images/store-team2.jpg" alt="Features" />
            <div class="info-content">
                <h2>Add new features</h2>
                <p>Upgrade your store with hundreds of powerful integrations and plugins.</p>
                <a href="#">Customize my store</a>
            </div>
        </div>
    </section>

    <!-- SERVICES SECTION -->
    <section class="services-section">
        <div class="service-box">
            <i class="bi bi-truck"></i>
            <h4>Free Shipping</h4>
            <p>On all orders over $100 worldwide.</p>
        </div>
        <div class="service-box">
            <i class="bi bi-credit-card"></i>
            <h4>Quick Payment</h4>
            <p>Multiple secure payment methods.</p>
        </div>
        <div class="service-box">
            <i class="bi bi-arrow-repeat"></i>
            <h4>Free Returns</h4>
            <p>30-day hassle-free returns.</p>
        </div>
        <div class="service-box">
            <i class="bi bi-headset"></i>
            <h4>24/7 Support</h4>
            <p>We’re here anytime you need help.</p>
        </div>




        <!-- ===== DOUBLE ROW SCROLLING IMAGES ===== --> <div class="scrolling-wrapper"> <div class="scrolling-row"> <!-- duplicate the image set for seamless looping --> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <!-- repeat them again for loop --> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> </div> <div class="scrolling-row reverse"> <!-- repeat for second row --> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <!-- duplicate again --> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> <img src="images/slide1.jpg" /> </div>
    </section>

</asp:Content>
