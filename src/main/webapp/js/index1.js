var li = document.querySelectorAll('#header_img ul li');
var header_img_content = document.querySelectorAll('.header_img_content');
// var header_img_content_1 = document.querySelector('.header_img_content_1');

var img = document.querySelectorAll('#header_img img');

var arr = [];
for (var i = 0; i < li.length; i++) {
    arr.push([getStyle(li[i], 'opacity'), getStyle(li[i], 'z-index')]);
}
console.log(arr);
var array = [];
for (var i = 0; i < header_img_content.length; i++) {
    array.push([getStyle(header_img_content[i], 'display')])
}

setInterval(function() {
    array.push(array[0]);
    array.shift();
    arr.push(arr[0]);
    arr.shift();
    for (var i = 0; i < li.length; i++) {
        li[i].style.opacity = arr[i][0];
        li[i].style.zIndex = arr[i][1];
        header_img_content[i].style.display = array[i][0];
    }

}, 2000);


var middle_content = document.querySelector('.middle_content');
var childnode = middle_content.children;
console.log(childnode);
var s = '';
var a = document.querySelectorAll('#middle .title_nav a');
for (let i = 0; i < a.length; i++) {
    a[i].onclick = function(ev) {
        ev.preventDefault();

        if (i == 0) {
            s = `<div class="movebox">
            <div class="first_move">
                <dl>
                    <dt>
                        <a href="">
                            <img src="img/152454.82425063_270X360X4.jpg" alt="">
                        </a>
                    </dt>
                    <dd>
                        <h2>
                            <a href="">后来的我们</a>
                        </h2>
                        <h3>
                            120分钟-
                            <span>爱情</span>
                        </h3>
                        <p class="hotMove">
                            <i class="icon"></i> "井柏然周冬雨演绎十年甜虐故事"
                        </p>
                        <div>

                            <a href="">选座购票</a>
                        </div>
                    </dd>
                </dl>
            </div>
            <div class="right_move">
                <ul>
                    <li>
                        <a href="">
                            <img src="img/105105.36604810_100X140X4.jpg" alt="">
                        </a>
                        <dl>
                            <dt>
                                <a href="">头号玩家</a>
                            </dt>
                            <dd class='time'>
                                114分钟-剧情
                            </dd>
                            <dd class="hot">
                                <i></i> 徐峥被困密室面临生死抉择
                            </dd>
                            <dd class="btn">
                                <a href="">选座购票</a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <a href="">
                            <img src="img/100510.39417350_100X140X4.jpg" alt="">
                        </a>
                        <dl>
                            <dt>
                                    <a href="">头号玩家</a>
                                </dt>
                            <dd class='time'>
                                114分钟-剧情
                            </dd>
                            <dd class="hot">
                                <i></i> 徐峥被困密室面临生死抉择
                            </dd>
                            <dd class="btn">
                                <a href="">选座购票</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
                <ul>
                    <li>
                        <a href="">
                            <img src="img/狂暴巨兽1.jpg" alt="">
                        </a>
                        <dl>
                            <dt>
                                    <a href="">头号玩家</a>
                                </dt>
                            <dd class='time'>
                                114分钟-剧情
                            </dd>
                            <dd class="hot">
                                <i></i> 徐峥被困密室面临生死抉择
                            </dd>
                            <dd class="btn">
                                <a href="">选座购票</a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <a href="">
                            <img src="img/头号玩家1.jpg" alt="">
                        </a>
                        <dl>
                            <dt>
                                        <a href="">头号玩家</a>
                                    </dt>
                            <dd class='time'>
                                114分钟-剧情
                            </dd>
                            <dd class="hot">
                                <i></i> 徐峥被困密室面临生死抉择
                            </dd>
                            <dd class="btn">
                                <a href="">选座购票</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
                <ul>
                    <li>
                        <a href="">
                            <img src="img/青年.jpg" alt="">
                        </a>
                        <dl>
                            <dt>
                                        <a href="">头号玩家</a>
                                    </dt>
                            <dd class='time'>
                                114分钟-剧情
                            </dd>
                            <dd class="hot">
                                <i></i> 徐峥被困密室面临生死抉择
                            </dd>
                            <dd class="btn">
                                <a href="">选座购票</a>
                            </dd>
                        </dl>
                    </li>
                    <li>
                        <a href="">
                            <img src="img/青年.jpg" alt="">
                        </a>
                        <dl>
                            <dt>
                                            <a href="">头号玩家</a>
                                        </dt>
                            <dd class='time'>
                                114分钟-剧情
                            </dd>
                            <dd class="hot">
                                <i></i> 徐峥被困密室面临生死抉择
                            </dd>
                            <dd class="btn">
                                <a href="">选座购票</a>
                            </dd>
                        </dl>
                    </li>
                </ul>
            </div>
        </div>`
        } else {
            s = `<div class="content">
            <ul>
                <li class="i_wantmover">
                    <a href=""><img src="img/头号玩家1.jpg" alt=""></a>
                    <div class="top">
                        <h3>头号玩家</h3>
                        <p>
                            <span>3d</span>
                            <i>/</i>
                            <span>动作</span>
                        </p>
                        <p class="i_wbr">
                            <b>导演：</b>
                            <span>任鹏远</span>
                        </p>
            
                        <p class="data">上映日期：
                            <span>2018-05月-11日</span>
                        </p>
                        <p class="sale">
                            <a href="">选座购票</a>
                        </p>
                    </div>
                </li>
                <li class="i_wantmover">
                    <a href=""><img src="img/头号玩家1.jpg" alt=""></a>
                    <div class="top">
                        <h3>头号玩家</h3>
                        <p>
                            <span>3d</span>
                            <i>/</i>
                            <span>动作</span>
                        </p>
                        <p class="i_wbr">
                            <b>导演：</b>
                            <span>任鹏远</span>
                        </p>
            
                        <p class="data">上映日期：
                            <span>2018-05月-11日</span>
                        </p>
                        <p class="sale">
                            <a href="">选座购票</a>
                        </p>
                    </div>
                </li><li class="i_wantmover">
                <a href=""><img src="img/头号玩家1.jpg" alt=""></a>
                <div class="top">
                    <h3>头号玩家</h3>
                    <p>
                        <span>3d</span>
                        <i>/</i>
                        <span>动作</span>
                    </p>
                    <p class="i_wbr">
                        <b>导演：</b>
                        <span>任鹏远</span>
                    </p>
        
                    <p class="data">上映日期：
                        <span>2018-05月-11日</span>
                    </p>
                    <p class="sale">
                        <a href="">选座购票</a>
                    </p>
                </div>
            </li><li class="i_wantmover">
            <a href=""><img src="img/头号玩家1.jpg" alt=""></a>
            <div class="top">
                <h3>头号玩家</h3>
                <p>
                    <span>3d</span>
                    <i>/</i>
                    <span>动作</span>
                </p>
                <p class="i_wbr">
                    <b>导演：</b>
                    <span>任鹏远</span>
                </p>
    
                <p class="data">上映日期：
                    <span>2018-05月-11日</span>
                </p>
                <p class="sale">
                    <a href="">选座购票</a>
                </p>
            </div>
        </li><li class="i_wantmover">
        <a href=""><img src="img/头号玩家1.jpg" alt=""></a>
        <div class="top">
            <h3>头号玩家</h3>
            <p>
                <span>3d</span>
                <i>/</i>
                <span>动作</span>
            </p>
            <p class="i_wbr">
                <b>导演：</b>
                <span>任鹏远</span>
            </p>

            <p class="data">上映日期：
                <span>2018-05月-11日</span>
            </p>
            <p class="sale">
                <a href="">选座购票</a>
            </p>
        </div>
    </li><li class="i_wantmover">
    <a href=""><img src="img/头号玩家1.jpg" alt=""></a>
    <div class="top">
        <h3>头号玩家</h3>
        <p>
            <span>3d</span>
            <i>/</i>
            <span>动作</span>
        </p>
        <p class="i_wbr">
            <b>导演：</b>
            <span>任鹏远</span>
        </p>

        <p class="data">上映日期：
            <span>2018-05月-11日</span>
        </p>
        <p class="sale">
            <a href="">选座购票</a>
        </p>
    </div>
</li><li class="i_wantmover">
<a href=""><img src="img/头号玩家1.jpg" alt=""></a>
<div class="top">
    <h3>头号玩家</h3>
    <p>
        <span>3d</span>
        <i>/</i>
        <span>动作</span>
    </p>
    <p class="i_wbr">
        <b>导演：</b>
        <span>任鹏远</span>
    </p>

    <p class="data">上映日期：
        <span>2018-05月-11日</span>
    </p>
    <p class="sale">
        <a href="">选座购票</a>
    </p>
</div>
</li>

            </ul>
        </div>
    </div>`
        }
        middle_content.innerHTML = s;
    }


}


function getStyle(obj, attr) {
    if (obj.currentStyle) {
        return obj.currentStyle[attr];
    } else {
        return getComputedStyle(obj, false)[attr];
    }
}