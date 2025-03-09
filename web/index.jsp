<%-- 
    Document   : index
    Created on : Feb 8, 2025, 11:59:03 PM
    Author     : Piri
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Mega City Cab</title>
        <script src="https://cdn.tailwindcss.com"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/all.min.js"></script>

        <style>
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            @keyframes slideInLeft {
                from {
                    opacity: 0;
                    transform: translateX(-50px);
                }
                to {
                    opacity: 1;
                    transform: translateX(0);
                }
            }
            /*     @keyframes bounce {
                     0%,100% { transform: translateY(0); }
                     50% { transform: translateY(-5px); }
                 }*/
            /* Fade In Animation */
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(30px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .animate-fadeInUp {
                animation: fadeInUp 1s ease-out;
            }

            .animate-float {
                animation: float 3s ease-in-out infinite;
            }
            .animate-fadeInUp {
                animation: fadeInUp 1s ease-out;
            }
            .animate-slideInLeft {
                animation: slideInLeft 1s ease-out;
            }
            .animate-bounce {
                animation: bounce 1.5s infinite;
            }
        </style>

    </head>
    <body class="bg-white">
        <!-- Header -->
        <header class="bg-white  p-3 fixed top-0 left-0 w-full z-50">
            <div class="container mx-auto flex justify-between items-center h-8">
                <div class="flex items-center space-x-4">
                    <img src="image/logo21.png" alt="Mega City Cab Logo" class="w-16 h-14 ml-12">
                    <h2 class="text-gray-600 text-xl font-bold">Mega City Cab</h2>
                </div>
                <nav class="space-x-8 text-gray-600  font-bold">
                    <a href="index.jsp" class="hover:text-emerald-500 transition duration-300">Home</a>
                    <a href="#about" class="hover:text-emerald-500 transition duration-300">About</a>
                    <a href="#contact" class="hover:text-emerald-500 transition duration-300">Contact Us</a>
                    <a href="#booking" class="hover:text-emerald-500 transition duration-300">Booking</a>
                    <a href="login.jsp" class="bg-emerald-500 text-white font-bold px-4 py-2 rounded-lg shadow hover:bg-white hover:text-emerald-500 hover:shadow-lg transition duration-300">Login</a>

                </nav>
            </div>
        </header> 



        <!-- Main Section with Image on Left & Text on Right -->
        <div class="mt-20 flex items-center gap-4">
            <!-- Short Description on the Right -->
            <div class="w-2/3 animate-fadeInUp ml-16">
                <h1 class="text-8xl font-bold text-emerald-600">MEGA CITY CAB</h1>
                <h3 class="text-2xl font-semibold text-gray-700 mt-2">
                    Your Ride, Your Comfort
                </h3>
                <p class="text-lg text-gray-600 mt-4">
                    Experience the Future of Cab Services with Mega City Cab!
                </p>

                <!-- Buttons Section -->
                <div class="mt-6 flex gap-6">
                    <!-- Call Button -->
                    <a href="tel:+94123456789" class="bg-gray-600 text-white px-6 py-2 rounded-lg shadow-md hover:bg-gray-900 transition duration-300">
                        Call Us Now
                    </a>

                    <!-- Book a Ride Button with Bounce -->
                    <a href="login.jsp" class="bg-emerald-500 text-white px-6 py-2 rounded-lg shadow-md hover:bg-emerald-600 transition duration-300 animate-bounce">
                        Book a Ride
                    </a>
                </div>
            </div>

            <!-- 3D Car Image on the Left with Animation -->
            <div class="w-1/3 flex justify-start">
                <img src="image/finalgray.png" alt="3D Car Model" class="max-w-md h-auto rounded-lg animate-slideInLeft">
            </div>
        </div>


        <!-- About Us Section -->
        <section id="about" class="relative bg-gradient-to-b from-white to-emerald-50 text-black py-20 px-6">
            <div class="max-w-7xl mx-auto flex flex-col md:flex-row items-center space-y-12 md:space-y-0 md:space-x-12">

                <!-- Image Section -->
                <div class="w-full md:w-1/2 relative group">
                    <img src="image/cabservice.jpg" alt="Mega City Cab" class="rounded-xl shadow-2xl transform group-hover:scale-105 transition-all duration-500">
                    <div class="absolute inset-0 bg-black opacity-20 rounded-xl group-hover:opacity-10 transition-opacity duration-500"></div>
                </div>

                <!-- Content Section -->
                <div class="w-full md:w-1/2 text-center md:text-left">
                    <!-- Heading -->
                    <h2 class="text-6xl font-extrabold text-transparent bg-clip-text bg-gradient-to-r from-emerald-600 to-yellow-400 mb-4">
                        ABOUT US
                    </h2>

                    <!-- Tagline -->
                    <p class="text-lg font-medium text-gray-600 italic mb-5">
                        "Your journey, our priority – Mega City Cab."
                    </p>

                    <!-- Description -->
                    <p class="text-lg text-gray-800 mb-6 leading-relaxed">
                        Welcome to <span class="text-emerald-600 font-semibold">Mega City Cab</span>, your trusted transportation partner in Colombo! 
                        We provide <span class="font-bold text-yellow-500">safe, reliable, and comfortable</span> rides with professional drivers and well-maintained vehicles. 
                        Whether you need a ride for daily commuting or long-distance travel, we've got you covered.
                    </p>


                    <!-- Stats Section -->
                    <div class="grid grid-cols-3 gap-6 text-center md:text-left mt-8">
                        <div class="p-4 bg-white shadow-md rounded-lg hover:shadow-xl transition-shadow duration-300">
                            <h3 class="text-3xl font-bold text-emerald-600">50K+</h3>
                            <p class="text-gray-700 text-sm">Happy Customers</p>
                        </div>
                        <div class="p-4 bg-white shadow-md rounded-lg hover:shadow-xl transition-shadow duration-300">
                            <h3 class="text-3xl font-bold text-emerald-600">200+</h3>
                            <p class="text-gray-700 text-sm">Professional Drivers</p>
                        </div>
                        <div class="p-4 bg-white shadow-md rounded-lg hover:shadow-xl transition-shadow duration-300">
                            <h3 class="text-3xl font-bold text-emerald-600">24/7</h3>
                            <p class="text-gray-700 text-sm">Service Availability</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <!-- Features Section -->
        <section class="py-20 px-6 bg-emerald-50 text-center">
            <h2 class="text-4xl font-bold text-emerald-600 mb-12">Why Choose Mega City Cab?</h2>

            <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-12">
                <!-- Feature 1 -->
                <div class="bg-white p-8 rounded-xl shadow-lg transition-all duration-500 transform hover:-translate-y-2 hover:shadow-2xl hover:shadow-cyan-500">
                    <h3 class="text-2xl font-semibold text-emerald-600 transition-colors duration-300 hover:text-yellow-500 mb-4">🚖 Safe & Reliable</h3>
                    <p class="text-gray-700">Our drivers ensure your safety and comfort throughout the ride.</p>
                </div>

                <!-- Feature 2 -->
                <div class="bg-white p-8 rounded-xl shadow-lg transition-all duration-500 transform hover:-translate-y-2 hover:shadow-2xl hover:shadow-cyan-500">
                    <h3 class="text-2xl font-semibold text-emerald-600 transition-colors duration-300 hover:text-yellow-500 mb-4">⏰ 24/7 Availability</h3>
                    <p class="text-gray-700">We’re available at all times, day and night, for your convenience.</p>
                </div>

                <!-- Feature 3 -->
                <div class="bg-white p-8 rounded-xl shadow-lg transition-all duration-500 transform hover:-translate-y-2 hover:shadow-2xl hover:shadow-cyan-500">
                    <h3 class="text-2xl font-semibold text-emerald-600 transition-colors duration-300 hover:text-yellow-500 mb-4">💰 Affordable Pricing</h3>
                    <p class="text-gray-700">Get the best value for money with our affordable and transparent pricing.</p>
                </div>
            </div>
        </section>

        <!-- Contact Us Section -->
        <section id="contact" class="py-20 px-6 bg-emerald-50">
            <div class="container mx-auto text-center animate-fadeInUp">

                <!-- Section Heading -->
                <h2 class="text-6xl font-extrabold text-emerald-600 tracking-wide uppercase mb-6">
                    Get In Touch
                </h2>
                <p class="text-xl text-gray-800 mb-8">We’re here to help you 24/7! Reach out anytime.</p>

                <!-- Contact Information -->
                <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-8 text-center">

                    <!-- Address Card -->
                    <div class="relative group p-8 rounded-2xl bg-white  shadow-md overflow-hidden transition-all duration-500 transform hover:-translate-y-2 hover:shadow-2xl">
                        <div class="absolute inset-0 w-2 bg-gradient-to-r from-emerald-600 to-sky-50 group-hover:w-full group-hover:opacity-80 transition-all duration-500"></div>
                        <div class="relative z-10 ">
                            <h3 class="text-2xl font-bold text-emerald-600">📍 Address</h3>
                            <p class="text-gray-700 mt-3 font-bold ">123 Main Street, Colombo, Sri Lanka</p>
                        </div>
                    </div>

                    <!-- Email Card -->
                    <div class="relative group p-8 rounded-2xl bg-white shadow-md overflow-hidden transition-all duration-500 transform hover:-translate-y-2 hover:shadow-2xl">
                        <div class="absolute inset-0 w-2 bg-gradient-to-r from-emerald-600 to-sky-50 group-hover:w-full group-hover:opacity-80 transition-all duration-500"></div>
                        <div class="relative z-10">
                            <h3 class="text-2xl font-bold text-yellow-500">📧 Email</h3>
                            <p class="text-gray-700 mt-3">megacitycab@gmail.com</p>
                        </div>
                    </div>

                    <!-- Working Hours Card -->
                    <div class="relative group p-8 rounded-2xl bg-white shadow-md overflow-hidden transition-all duration-500 transform hover:-translate-y-2 hover:shadow-2xl">
                        <div class="absolute inset-0 w-2 bg-gradient-to-r from-emerald-600 to-sky-50 group-hover:w-full group-hover:opacity-80 transition-all duration-500"></div>
                        <div class="relative z-10">
                            <h3 class="text-2xl font-bold text-gray-800">🕘 Working Hours</h3>
                            <p class="text-gray-700 mt-3">24/7 Service Available</p>
                        </div>
                    </div>

                </div>

                <!-- Google Map -->
                <div class="mt-16">
                    <h3 class="text-4xl font-bold text-emerald-600 mb-6">📍 Find Us Here</h3>
                    <div class="w-full h-96 rounded-lg shadow-md overflow-hidden">
                        <iframe class="w-full h-full" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" alt="google map"
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d31686.228632183815!2d79.84782623106591!3d6.921804265442585!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2593c4185d5a1%3A0xa2b7f3f5d1f3329b!2sColombo!5e0!3m2!1sen!2slk!4v1635864587321!5m2!1sen!2slk">
                        </iframe>
                    </div>
                </div>

                <!-- FAQ Section -->
                <div class="mt-16 text-left max-w-4xl mx-auto">
                    <h3 class="text-4xl font-bold text-emerald-600 mb-8">❓ Frequently Asked Questions</h3>
                    <div class="space-y-6">
                        <details class="bg-gray-100 p-5 rounded-md shadow-md cursor-pointer transition-all duration-300 hover:bg-gray-200">
                            <summary class="text-lg font-semibold text-emerald-700 flex items-center">
                                🚖 How can I book a ride? 
                                <span class="ml-auto">▼</span>
                            </summary>
                            <p class="text-gray-700 mt-3">You can book a ride using our website or by calling us directly.</p>
                        </details>
                        <details class="bg-gray-100 p-5 rounded-md shadow-md cursor-pointer transition-all duration-300 hover:bg-gray-200">
                            <summary class="text-lg font-semibold text-emerald-700 flex items-center">
                                💳 What payment methods do you accept? 
                                <span class="ml-auto">▼</span>
                            </summary>
                            <p class="text-gray-700 mt-3">We accept cash, credit/debit cards, and online payments.</p>
                        </details>
                        <details class="bg-gray-100 p-5 rounded-md shadow-md cursor-pointer transition-all duration-300 hover:bg-gray-200">
                            <summary class="text-lg font-semibold text-emerald-700 flex items-center">
                                ⏳ How long does it take to get a cab? 
                                <span class="ml-auto">▼</span>
                            </summary>
                            <p class="text-gray-700 mt-3">Our drivers usually arrive within 5-10 minutes of booking.</p>
                        </details>
                    </div>
                </div>

            </div>
        </section>


        <!-- Booking Section -->
        <section id="booking" class="py-24 px-6 relative bg-gradient-to-r from-emerald-700 via-emerald-600 to-emerald-500 text-white overflow-hidden">
            <div class="container mx-auto text-center relative z-10">
                <!-- Section Heading -->
                <div class="flex flex-row">
                    <div class="flex flex-col">
                        <h2 class="text-4xl lg:text-5xl font-extrabold text-white mb-6 tracking-wide animate-fadeInUp">
                            Book Your Ride with <br> <span class="text-yellow-400 space-y-10">Mega City Cab</span>
                        </h2>
                        <p class="text-lg lg:text-xl text-gray-200 mb-8 max-w-2xl mx-auto animate-fadeInUp delay-200 ">
                            Booking your ride is <span class="text-yellow-300 font-semibold">quick, easy, and seamless.</span>  
                            Experience <span class="text-yellow-300 font-semibold">comfort and reliability</span> with Mega City Cab,  
                            ensuring you reach your destination <span class="text-yellow-300 font-semibold">safely and on time.</span>  
                            Whether it’s a daily commute, an airport transfer, or a special event,  
                            our <span class="text-yellow-300 font-semibold">professional drivers</span> and well-maintained vehicles are here for you.
                        </p>
                    </div>

                    <form action="BookingServlet" method="POST" class="bg-white p-6 rounded-xl shadow-2xl max-w-lg mx-auto text-gray-800 border border-gray-200 space-y-2">
                        <div class="flex flex-row space-x-4">
                            <div class="w-1/2">
                                <label for="fullName" class="block text-lg font-semibold text-gray-700 mb-1">Full Name</label>
                                <input type="text" id="fullName" name="fullName" required class="w-full px-2 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            </div>

                            <div class="w-1/2">
                                <label for="phone" class="block text-lg font-semibold text-gray-700 mb-1">Phone Number</label>
                                <input type="text" id="phone" name="phone" required class="w-full px-2 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-emerald-500">
                            </div>
                        </div>
                        <div class="flex flex-row space-x-4">
                            <div class="w-1/2">
                                <label for="start-location" class="block text-lg font-semibold text-gray-700 mb-1">Start Location</label>
                                <input type="text" id="start-location" name="startLoc" required class="w-full px-2 py-2 border border-gray-300 rounded-lg">
                            </div>

                            <div class="w-1/2">
                                <label for="end-location" class="block text-lg font-semibold text-gray-700 mb-1">End Location</label>
                                <input type="text" id="end-location" name="endLoc" required class="w-full px-2 py-2 border border-gray-300 rounded-lg">
                            </div>
                        </div>
                        <div class="mt-4">
                            <label for="Cabs" class="block text-lg font-semibold text-gray-700 mb-1">Cabs</label>
                            <input type="text" id="Cabs" name="cab" required class="w-full px-2 py-2 border border-gray-300 rounded-lg">
                        </div>

                        <button type="submit" class="w-full mt-6  px-6 py-3 text-lg text-white bg-gradient-to-r from-yellow-500 to-yellow-600 hover:scale-105">
                            🚖 Book Now
                        </button>
                    </form>


                </div>
            </div>

            <!-- Floating Animated Elements for a Dynamic Look -->
            <div class="absolute inset-0 flex items-center justify-center">
                <div class="w-96 h-96 bg-cyan-500 opacity-10 rounded-full blur-3xl absolute -top-10 left-20 animate-pulse"></div>
                <div class="w-64 h-64 bg-white opacity-5 rounded-full blur-2xl absolute bottom-10 right-20 animate-ping"></div>
            </div>
        </section>


        <!-- Tailwind Keyframe Animations -->
        <style>
            @keyframes fadeInUp {
                from {
                    opacity: 0;
                    transform: translateY(20px);
                }
                to {
                    opacity: 1;
                    transform: translateY(0);
                }
            }
            .animate-fadeInUp {
                animation: fadeInUp 1s ease-out;
            }
        </style>

        <!-- Testimonials Section -->
        <section class="py-20 px-6 bg-gradient-to-b from-white to-emerald-100 text-center">
            <h2 class="text-4xl font-bold text-transparent bg-clip-text bg-emerald-600 mb-12">
                What Our Customers Say
            </h2>
            <div class="flex flex-col md:flex-row md:space-x-12 space-y-8 md:space-y-0 justify-center">
                <!-- Testimonial 1 -->
                <div class="bg-white p-4 rounded-xl shadow-lg transform transition duration-500 hover:scale-105 hover:shadow-2xl max-w-md mx-auto relative">
                    <div class="flex items-center space-x-4 mb-4">
                        <img class="w-16 h-16 rounded-full object-cover" src="image/g3.png" alt="Sarah M." />
                        <p class="text-xl font-semibold text-emerald-600">- Sarah M.</p>
                    </div>
                    <p class="text-lg text-gray-700 italic mb-4">"Mega City Cab is amazing! The ride was comfortable, and the driver was very professional. Highly recommend!"</p>
                    <div class="flex justify-center space-x-2 mb-4">
                        <!-- Star SVG Rating -->
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                    </div>
                </div>
                <!-- Testimonial 2 -->
                <div class="bg-white p-8 rounded-xl shadow-lg transform transition duration-500 hover:scale-105 hover:shadow-2xl max-w-md mx-auto relative">
                    <div class="flex items-center space-x-4 mb-4">
                        <img class="w-16 h-16 rounded-full object-cover" src="image/g4.jpg" alt="John D." />
                        <p class="text-xl font-semibold text-emerald-600">- John D.</p>
                    </div>
                    <p class="text-lg text-gray-700 italic mb-4">"Always on time! The booking process is easy, and the drivers are friendly. I trust Mega City Cab for all my rides."</p>
                    <div class="flex justify-center space-x-2 mb-4">
                        <!-- Star SVG Rating -->
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                    </div>
                </div>

                <!-- Testimonial 3 -->
                <div class="bg-white p-8 rounded-xl shadow-lg transform transition duration-500 hover:scale-105 hover:shadow-2xl max-w-md mx-auto relative">
                    <div class="flex items-center space-x-4 mb-4">
                        <img class="w-16 h-16 rounded-full object-cover" src="image/g1.png" alt="Jessica A." />
                        <p class="text-xl font-semibold text-emerald-600">- Jessica A.</p>
                    </div>
                    <p class="text-lg text-gray-700 italic mb-4">"Excellent service! The drivers are always courteous, and the cars are always clean and well-maintained."</p>
                    <div class="flex justify-center space-x-2 mb-4">
                        <!-- Star SVG Rating -->
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                        <svg class="w-6 h-6 text-yellow-500" fill="currentColor" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg">
                        <path d="M10 15l-3.09 1.63L7.6 12.68 5 9.88l3.91-.34L10 3l1.09 6.54 3.91.34-2.6 2.8 1.69 4.95L10 15z"></path>
                        </svg>
                    </div>
                </div>
            </div>
        </section>


        <!-- Footer -->
        <footer class="bg-gradient-to-b from-emerald-100 to-emerald-700 text-black py-10 font-bold">
            <div class="container mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 text-sm px-6">

                <!-- Mega City Cab Description -->
                <div>
                    <h3 class="text-4xl font-semibold mb-4">Mega <span class="text-yellow-600 font-bold">City Cab</span></h3>
                    <p class="text-black">Your trusted cab service in Colombo. Safe, fast, and reliable rides at your fingertips.</p>
                </div>

                <!-- Quick Links -->
                <div>
                    <ul class="space-y-2 text-center">
                        <li><a href="index.jsp" class="hover:text-yellow-400 transition">Home</a></li>
                        <li><a href="#about" class="hover:text-yellow-400 transition">About</a></li>
                        <li><a href="ride.jsp" class="hover:text-yellow-400 transition">Book a Ride</a></li>
                        <li><a href="#booking" class="hover:text-yellow-400 transition">Booking</a></li>


                    </ul>
                </div>

                <!-- Legal & Careers -->
                <div>
                    <ul class="space-y-2 text-center">
                        <li><a href="terms.html" class="hover:text-yellow-400 transition">T & C</a></li>
                        <li><a href="privacy.html" class="hover:text-yellow-400 transition">Privacy Policy</a></li>
                        <li><a href="careers.html" class="hover:text-yellow-400 transition">Careers</a></li>
                        <li><a href="#contact" class="hover:text-yellow-400 transition">Contact Us</a></li>
                    </ul>
                </div>

                <!-- Social Media -->
                <div>
                    <h3 class="text-xl font-semibold mb-3 text-center">Follow Us</h3>
                    <div class="flex space-x-4 justify-center">
                        <a href="#" class="hover:text-yellow-400 transition">
                            <i class="fab fa-facebook-f text-2xl"></i>
                        </a>
                        <a href="#" class="hover:text-yellow-400 transition">
                            <i class="fab fa-twitter text-2xl"></i>
                        </a>
                        <a href="#" class="hover:text-yellow-400 transition">
                            <i class="fab fa-instagram text-2xl"></i>
                        </a>
                        <a href="#" class="hover:text-yellow-400 transition">
                            <i class="fab fa-linkedin-in text-2xl"></i>
                        </a>
                    </div>
                </div>
            </div>

            <!-- Divider -->
            <div class="border border-gray-600 mt-8 mx-6"></div>

            <!-- Copyright -->
            <div class="text-center text-white text-sm mt-4">
                &copy; 2025 Mega City Cab. All Rights Reserved.
            </div>
        </footer>





    </body>
</html>
