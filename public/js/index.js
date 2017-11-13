var deleteProfile = document.getElementById('deleteProfile');
var deletePForm = document.getElementById('deletePForm');

deleteProfile.onclick = function() {
confirm('Are you sure you you want to delete your profile?')? deletePForm.submit() : alert('Request Aborted') }

var myIndex = 0;
carousel()

function carousel() {
    var i;
    var x = document.getElementsByClassName("SS");
    for (i = 0; i < x.length; i++) {
       x[i].style.display = "none";
    }
    myIndex++;
    if (myIndex > x.length) {myIndex = 1}
    x[myIndex-1].style.display = "block";
    setTimeout(carousel, 4000);
}
