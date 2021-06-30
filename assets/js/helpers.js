import AOS from 'aos';
import 'aos/dist/aos.css';


 function toggleNavbar(collapseID) {
      document.getElementById(collapseID).classList.toggle('hidden')
      document.getElementById(collapseID).classList.toggle('block')
    }

function testLog(){
    console.log("helper js file hello")
}

 AOS.init({
      delay: 200,
      duration: 1200,
      once: false,
    })
