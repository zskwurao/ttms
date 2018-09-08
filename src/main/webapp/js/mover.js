let ul1 = document.querySelectorAll(".ul1");

console.log(ul1.length);
for (let i = 0; i < ul1.length; i++) {
    let oLi = ul1[i].querySelectorAll('li');
    for (let j = 0; j < oLi.length; j++) {

        let a = oLi[j].querySelectorAll('a');

        a[0].onclick = function() {
            event.preventDefault();
            console.log(this.innerHTML);
            this.style.color = 'red';

        }
    }
}