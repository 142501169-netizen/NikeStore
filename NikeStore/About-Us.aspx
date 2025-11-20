<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About-Us.aspx.cs" Inherits="NikeStore.About_Us" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        body { animation: fadeIn 1.5s ease-in-out; }
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(15px); }
            to { opacity: 1; transform: translateY(0); }
        }

        .about-container {
            width: 90%;
            max-width: 1300px;
            margin: 80px auto;
            text-align: center;
        }

        .about-container h1 {
            font-size: 3rem;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .about-container p {
            font-size: 1.2rem;
            color: #444;
            margin-bottom: 50px;
        }

        /* ===== MAIN SLIDER ===== */
        .slider-container {
            position: relative;
            width: 100%;
            height: 90vh;
            overflow: hidden;
            background: #000;
        }

        .slide {
            position: absolute;
            inset: 0;
            background-size: cover;
            background-position: center;
            opacity: 0;
            transform: scale(1.1);
            transition: opacity 1s ease, transform 2s ease;
        }

        .slide.active {
            opacity: 1;
            transform: scale(1);
            z-index: 2;
        }

        /* ===== SLIDE TEXT ===== */
        .slide-text {
            position: absolute;
            top: 45%;
            left: 8%;
            color: white;
            font-family: 'Poppins', sans-serif;
            max-width: 550px;
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 1s ease, transform 1s ease;
        }

        .slide.active .slide-text {
            opacity: 1;
            transform: translateY(0);
        }

        .slide-text h1 {
            font-size: 3.5rem;
           color: #00ff99;

        }

        .slide-text h2 {
            font-size: 2.5rem;
            margin-bottom: 20px;
        }

        .slide-text p {
            font-size: 1rem;
            margin-bottom: 20px;
            color: #ddd;
        }

        .slide-text .btn {
            display: inline-block;
            padding: 10px 20px;
            border: 2px solid #00ff99;
            color: #00ff99;
            border-radius: 5px;
            text-decoration: none;
            transition: 0.3s;
        }

        .slide-text .btn:hover {
            background: #00ff99;
            color: black;
        }

        .thumbs {
            position: absolute;
            right: 50px;
            bottom: 40px;
            display: flex;
            gap: 15px;
            z-index: 3;
        }

        .thumb {
            width: 120px;
            height: 80px;
            border-radius: 12px;
            background-size: cover;
            background-position: center;
            cursor: pointer;
            opacity: 0.6;
            transition: transform 0.5s, opacity 0.5s;
        }

        .thumb:hover,
        .thumb.active {
            transform: scale(1.1);
            opacity: 1;
            border: 2px solid #00ff99;
        }

        /* ===== TEAM SECTION ===== */
        .team-section {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 40px;
            padding: 60px 0;
        }

        .team-card {
            width: 300px;
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.1);
            overflow: hidden;
            transition: transform .3s ease, box-shadow .3s ease;
        }

        .team-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
        }

        .team-card img {
            width: 100%;
            height: 280px;
            object-fit: cover;
        }

        .team-info {
            padding: 20px;
        }

        .team-info h3 {
            font-size: 1.3rem;
            margin-bottom: 10px;
        }

        .team-info p {
            color: #555;
            font-size: 0.95rem;
        }



        .company-section {
    width: 90%;
    max-width: 1200px;
    margin: 80px auto;
    font-family: 'Poppins', sans-serif;
    color: #333;
}

.company-section h2 {
    font-size: 2.2rem;
    color: #111;
    margin-bottom: 20px;
}

.company-section p {
    font-size: 1.1rem;
    line-height: 1.6;
    color: #555;
}

/* ABOUT */
.about-section {
    text-align: center;
    margin-bottom: 80px;
}

.about-section img {
    width: 100%;
    max-width: 700px;
    border-radius: 12px;
    margin-top: 25px;
}

/* MISSION */
.mission-section, .story-section {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 40px;
    margin-bottom: 80px;
    flex-wrap: wrap;
}

.mission-text, .story-text {
    flex: 1;
    min-width: 300px;
}

.mission-img img, .story-img img {
    width: 100%;
    max-width: 500px;
    border-radius: 12px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.1);
}

/* NUMBERS */
.numbers-section {
    text-align: center;
    background: #f8f9fb;
    padding: 60px 20px;
    border-radius: 16px;
}

.numbers-grid {
    display: flex;
    flex-wrap: wrap;
    justify-content: center;
    gap: 40px;
    margin-top: 40px;
}

.number-card {
    background: #fff;
    padding: 30px 40px;
    border-radius: 14px;
    box-shadow: 0 4px 12px rgba(0,0,0,0.08);
    width: 250px;
    transition: transform 0.3s, box-shadow 0.3s;
}

.number-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 18px rgba(0,0,0,0.12);
}

.number-card h3 {
    font-size: 2rem;
    color: #00b67a;
    margin-bottom: 10px;
}

.number-card a {
    display: inline-block;
    color: #00b67a;
    text-decoration: none;
    font-weight: 600;
    margin-top: 5px;
}

.number-card a:hover {
    text-decoration: underline;
}

/* Fade-in Animation */
@keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
}

.company-section > div {
    animation: fadeUp 1s ease forwards;
    opacity: 0;
}

.company-section > div:nth-child(1) { animation-delay: 0.2s; }
.company-section > div:nth-child(2) { animation-delay: 0.4s; }
.company-section > div:nth-child(3) { animation-delay: 0.6s; }
.company-section > div:nth-child(4) { animation-delay: 0.8s; }

        .auto-style1 {
            margin-left: 14px;
            margin-right: 0px;
        }

    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- ===== SLIDER SECTION ===== -->
    <div class="slider-container">
        <div class="slide active" style="background-image: url('images/75.jpg');">
            <div class="slide-text">
                <h1>SLIDER</h1>
                <h2>BUTTERFLY</h2>
                <p>Discover nature’s beauty through our vibrant collection of wildlife captures.</p>
                <a href="#" class="btn">See More</a>
                <a href="Login.aspx" class="btn">Subscribe</a>
            </div>
        </div>

        <div class="slide" style="background-image: url('images/00.jpg');">
            <div class="slide-text">
                <h1>ELEGANT</h1>
                <h2>STYLE</h2>
                <p>Explore premium fashion trends that define your confidence and comfort.</p>
                <a href="NikeProducts.aspx" class="btn">Shop Now</a>
                <a href="#" class="btn">Learn More</a>
            </div>
        </div>

        <div class="slide" style="background-image: url('images/76.jpg');">
            <div class="slide-text">
                <h1>MODERN</h1>
                <h2>TECH</h2>
                <p>Upgrade your everyday life with cutting-edge electronics and accessories.</p>
                <a href="#" class="btn">Discover</a>
                <a href="#" class="btn">Buy Now</a>
            </div>
        </div>

        <div class="thumbs">
            <div class="thumb active" style="background-image: url('images/75.jpg');"></div>
            <div class="thumb" style="background-image: url('images/00.jpg');"></div>
            <div class="thumb" style="background-image: url('images/76.jpg');"></div>
        </div>
    </div>

    <!-- ===== TEAM SECTION ===== -->
    <div class="about-container">
        <h1>Meet Our Dream Team</h1>
        <p>We’re passionate about crafting high-quality footwear and exceptional shopping experiences for you.</p>

        <div class="team-section">
            <div class="team-card">
                <img src="images/ceo2.jpg" alt="Team Member 1" />
                <div class="team-info">
                    <h3>Bulumko Marwanqa</h3>
                    <p>Creative Director</p>
                </div>
            </div>

            <div class="team-card">
                <img src="images/chief executive.jpg" alt="Team Member 2" />
                <div class="team-info">
                    <h3>Yive Faniso</h3>
                    <p>Lead Developer</p>
                </div>
            </div>

            <div class="team-card">
                <img src="images/manager.jpg" alt="Team Member 3" />
                <div class="team-info">
                    <h3>Ishmaeel Gray</h3>
                    <p>Marketing Specialist</p>
                </div>
            </div>
        </div>
    </div>




        <!-- ===== COMPANY STORY SECTION (Inspired by HubSpot design) ===== -->
    <section class="company-section">
        <div class="about-section">
            <h2>About Us</h2>
            <p>
                Our company culture and mission are designed around excellence, innovation, and growth.
                We’re passionate about crafting exceptional experiences for our customers — built with care, not cobbled together.
            </p>
            <img src="images/74.jpg" alt="About Us Team" class="auto-style1" />
        </div>

        <div class="mission-section">
            <div class="mission-text">
                <h2>Our Mission: Helping Millions Grow Better</h2>
                <p>
                    We believe growth isn’t just about becoming bigger — it’s about becoming better.
                    Our mission is to empower individuals and organizations to achieve more while staying true to their values.
                </p>
            </div>
            <div class="mission-img">
                <img src="images/73.jpg" alt="Our Mission" />
            </div>
        </div>

        <div class="story-section">
            <div class="story-img">
                <img src="images/72.jpg" alt="Our Story" />
            </div>
            <div class="story-text">
                <h2>Our Story</h2>
                <p>
                    Founded in 2015, we started with a simple idea: to deliver innovative, affordable, and stylish products
                    that inspire confidence and creativity. Today, we continue to expand globally while keeping our commitment
                    to quality, design, and customer satisfaction.
                </p>
            </div>
        </div>

        <div class="numbers-section">
            <h2>Our Growth in Numbers</h2>
            <div class="numbers-grid">
                <div class="number-card">
                    <h3>12</h3>
                    <p>Global Offices</p>
                    <a href="#">Learn more</a>
                </div>
                <div class="number-card">
                    <h3>7,600+</h3>
                    <p>Employees</p>
                    <a href="#">Learn more</a>
                </div>
                <div class="number-card">
                    <h3>205,000+</h3>
                    <p>Customers</p>
                    <a href="#">Learn more</a>
                </div>
            </div>
        </div>
    </section>


    <script>
        document.addEventListener("DOMContentLoaded", () => {
            const slides = document.querySelectorAll(".slide");
            const thumbs = document.querySelectorAll(".thumb");
            let index = 0;

            function showSlide(i) {
                slides.forEach((s, idx) => {
                    s.classList.toggle("active", idx === i);
                    thumbs[idx].classList.toggle("active", idx === i);
                });
            }

            thumbs.forEach((thumb, i) => {
                thumb.addEventListener("click", () => {
                    index = i;
                    showSlide(index);
                });
            });

            setInterval(() => {
                index = (index + 1) % slides.length;
                showSlide(index);
            }, 6000);
        });
    </script>
</asp:Content>
