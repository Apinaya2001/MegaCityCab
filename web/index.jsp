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
         from { opacity: 0; transform: translateY(30px); }
         to { opacity: 1; transform: translateY(0); }
     }
     @keyframes slideInLeft {
         from { opacity: 0; transform: translateX(-50px); }
         to { opacity: 1; transform: translateX(0); }
     }
/*     @keyframes bounce {
         0%,100% { transform: translateY(0); }
         50% { transform: translateY(-5px); }
     }*/

     .animate-fadeInUp { animation: fadeInUp 1s ease-out; }
     .animate-slideInLeft { animation: slideInLeft 1s ease-out; }
     .animate-bounce { animation: bounce 1.5s infinite; }
     </style>

</head>
<body class="bg-white">
    <!-- Header -->
    <header class="bg-white shadow-[0_4px_6px_0_rgba(16,385,129,0.5)] p-3 fixed top-0 left-0 w-full z-50">
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
                <a href="login.jsp" class="bg-emerald-500 text-white font-bold px-4 py-2 rounded-xl shadow hover:bg-white hover:text-emerald-500 hover:shadow-lg transition duration-300">Login</a>

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
  


<section class="bg-gray-900 text-white py-16 px-6">
    <div class="max-w-7xl mx-auto flex flex-col md:flex-row items-center">
        
        <!-- Image Section -->
        <div class="w-full md:w-1/2 mb-6 md:mb-0">
            <img src="image/" alt="Mega City Cab" class="rounded-lg shadow-lg">
        </div>

        <!-- Content Section -->
        <div class="w-full md:w-1/2 md:pl-10">
            <h2 class="text-4xl font-bold text-yellow-400 mb-4">About Mega City Cab</h2>
            <p class="text-lg text-gray-300 mb-4">
                Welcome to <span class="text-yellow-400 font-semibold">Mega City Cab</span>, your trusted transportation partner in Colombo! 
                We provide safe, reliable, and comfortable rides with professional drivers and well-maintained vehicles. Whether you need 
                a ride for daily commuting or long-distance travel, we've got you covered.
            </p>
            
            <h3 class="text-2xl font-semibold text-yellow-300 mt-6">Contact Us</h3>
            <p class="text-lg text-gray-300">📧 Email: <a href="mailto:info@megacitycab.com" class="text-yellow-400 underline">info@megacitycab.com</a></p>
            <p class="text-lg text-gray-300">📞 Phone: +94 77 123 4567</p>
            <p class="text-lg text-gray-300">📍 Location: Colombo, Sri Lanka</p>
        </div>

    </div>
</section>

    <!-- Contact Us Section -->
    <section id="contact" class="py-16 px-6 bg-white">
        <div class="container mx-auto text-center">
            <h2 class="text-4xl font-semibold text-emerald-600 mb-6">Contact Us</h2>
            <p class="text-lg text-gray-700 mb-4">Feel free to reach out to us. We’re here to assist you with anything you need.</p>
            <a href="tel:+94123456789" class="bg-yellow-500 hover:bg-yellow-600 text-white px-6 py-2 rounded-lg text-lg">Call Us Now</a>
        </div>
    </section>

    <!-- Booking Section -->
    <section id="booking" class="py-16 px-6 bg-gray-50">
        <div class="container mx-auto text-center">
            <h2 class="text-4xl font-semibold text-emerald-600 mb-6">Book a Ride</h2>
            <p class="text-lg text-gray-700 mb-6">Booking a ride with Mega City Cab is quick and easy. Simply click the button below to get started.</p>
            <a href="booking.html" class="bg-emerald-500 hover:bg-emerald-600 text-white px-6 py-2 rounded-lg text-lg">Book Now</a>
        </div>
    </section>

<!-- Footer -->
<footer class="bg-gradient-to-b from-emerald-900 to-emerald-300 text-white py-10 font-bold">
    <div class="container mx-auto grid grid-cols-1 md:grid-cols-4 gap-8 text-sm px-6">

        <!-- Mega City Cab Description -->
        <div>
            <h3 class="text-4xl font-semibold mb-4">Mega <span class="text-yellow-400">City Cab</span></h3>
            <p class="text-white">Your trusted cab service in Colombo. Safe, fast, and reliable rides at your fingertips.</p>
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
    <div class="text-center text-black text-sm mt-4">
        &copy; 2025 Mega City Cab. All Rights Reserved.
    </div>
</footer>





</body>
</html>
