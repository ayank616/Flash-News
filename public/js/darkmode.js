document.addEventListener("DOMContentLoaded", function() {
    // Get the content element
    var content = document.body;
  
    // Get the dark mode toggle button
    var darkmode = document.getElementById("dark-mode");
  
    // Retrieve dark mode preference from localStorage
    var isDarkMode = localStorage.getItem("darkMode");

    if (isDarkMode) {
      content.setAttribute("data-bs-theme", "dark");
      darkmode.classList.add("active", "night");
    }
  
    // Function to toggle dark mode
    function toggleDarkMode() {
      darkmode.classList.toggle("active");
      darkmode.classList.toggle("night");
      if (darkmode.classList.contains("night")) {
        content.setAttribute("data-bs-theme", "dark");
        // Save dark mode preference to localStorage
        localStorage.setItem("darkMode", "true");
      } else {
        content.setAttribute("data-bs-theme", "light");
        // Remove dark mode preference from localStorage
        localStorage.removeItem("darkMode");
      }
    }
  
    // Add click event listener to toggle dark mode
    darkmode.addEventListener("click", toggleDarkMode);
  });
  