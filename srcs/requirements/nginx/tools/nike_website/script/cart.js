let cartP ;
let cartF ;
let shoppingCart = document.querySelector(".shopping-cart .container");



// verification 
if(localStorage.getItem("cartProduct") == null){
    cartP = [];
}else {
    cartP = JSON.parse(localStorage.getItem("cartProduct"));
}

// show product


function showCarts(){
    for(let i = 0 ; i<cartP.length; i++){
        shoppingCart.innerHTML += 
        `<div class="feature">
            <div class="image">
                <img src="${cartP[i].image}" alt="">
            </div>
            <div class="desc">
                <h4 class="title">${cartP[i].title}</h4>
                <div class="note">
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-solid fa-star"></i>
                    <i class="fa-regular fa-star"></i>
                </div>
                <div class="para">
                    <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Dicta facilis praesentium odit voluptas illum iure libero quis fuga commodi. Autem.</p>
                </div>
                <h4 class="price">${cartP[i].price}<span>${cartP[i].solde}</span></h4>
            
                <div class="delete-from-cart"><button>Delete</button></div>
            </div>
        </div>
        `
    }
}
showCarts();
