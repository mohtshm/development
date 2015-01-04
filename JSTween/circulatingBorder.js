 $.fn.circulatingBorder = function (t) {
    var ov = { color: 'red', thickness: '3px', yGap: '0', xGap: '0' },
    e = {
        time1: "1",
        time2: "0.8",
        time3: "0.4",
        distance: "-50%",
        ease1: "Expo.easeInOut"
    }, n = e, ov = $.extend(ov, t);
    return this.each(function () {
        var t = $(this),
            e = n.time1,
            i = n.time2,
            s = n.time3,
            pr = t.parent();
        n.distance;
        pr.append(
            //$('<div style="margin: 10px; border: none; position: relative; overflow: hidden;" />').append(t).append($('<span style="display:none; width :100%; right: .1%; position: absolute; background: ' + ov.color + '; top: ' + ov.yGap + '; height: ' + ov.thickness + ';"></span>')).append('<span style="display:none;position: absolute; background: ' + ov.color + '; top: ' + ov.yGap + '; height: ' + ov.thickness + '; right: 0; width: 0;"></span>')
            $('<div style=" border: none; position: relative; overflow: hidden;" />').append(t)
            .append($('<span style=" width :100%; right: 0; position: absolute; background: ' + ov.color + '; top: ' + ov.yGap + '; height: ' + ov.thickness + ';"></span>')).append($('<span style="position: absolute; background: ' + ov.color + '; top: ' + ov.yGap + '; height: ' + ov.thickness + '; right: 0; width: 0;" />'))
            .append($('<span style="height: 100%; bottom: 0; position: absolute; background: ' + ov.color + ';right: ' + ov.xGap + '; width: ' + ov.thickness + ';"></span>')).append($('<span style="position: absolute; background: ' + ov.color + ';right: ' + ov.xGap + '; width: ' + ov.thickness + '; height: 0; bottom: 0;" />'))
            .append($('<span style="width: 100%; left: 0; position: absolute; background: ' + ov.color + '; bottom: ' + ov.yGap + '; height: ' + ov.thickness + ';"></span>')).append($('<span style=" position: absolute; background: ' + ov.color + '; bottom: ' + ov.yGap + '; height: ' + ov.thickness + ';width: 0; left: 0;"></span>'))
            .append($('<span style="height: 100%; top: 0; position: absolute; background: ' + ov.color + ';left: ' + ov.xGap + '; width: ' + ov.thickness + ';"></span>')).append($('<span style="position: absolute; background: ' + ov.color + ';left: ' + ov.xGap + '; width: ' + ov.thickness + ';height: 0; top: 0;"></span>'))
            );
        var timerc = null;
        var container = t.parent();
        var r = n.ease1,
            topLine = $("span:nth-child(2)", container),
              topLineZit = $("span:nth-child(3)", container),
            rightLine = $("span:nth-child(4)", container),
              rightLineZit = $("span:nth-child(5)", container),
               bottomLine = $("span:nth-child(6)", container),
              bottomLineZit = $("span:nth-child(7)", container),
                  leftLine = $("span:nth-child(8)", container),
              leftLineZit = $("span:nth-child(9)", container),
            ca = new TimelineMax;        
        ca.insert(TweenMax.to(topLine, e, {
            css: {
                right: "100%"
            },
            ease: r
        }))
        , ca.insert(TweenMax.to(topLineZit, i, {
            css: {
                width: "100%"
            },
            delay: s,
            ease: r
        }))
        , ca.insert(TweenMax.to(rightLine, e, {
            css: {
                bottom: "100%"
            },
            ease: r
        }))
        , ca.insert(TweenMax.to(rightLineZit, i, {
            css: {
                height: "100%"
            },
            delay: s,
            ease: r
        }))
        , ca.insert(TweenMax.to(bottomLine, e, {
            css: {
                left: "100%"
            },
            ease: r
        }))
        , ca.insert(TweenMax.to(bottomLineZit,i, {
            css: {
                width: "100%"
            },
            delay: s,
            ease: r
        }))
         , ca.insert(TweenMax.to(leftLine, e, {
             css: {
                 top: "100%"
             },
             ease: r
         }))
        , ca.insert(TweenMax.to(leftLineZit,i, {
            css: {
                height: "100%"
            },
            delay: s,
            ease: r
        }))
        , ca.stop(), container.hover(function () {
            if (timerc) {
                clearInterval(timerc);
            }
            container.children('span').show();
            ca.stop()
            ca.play();
        }, function () {
            ca.reverse();
            timerc = setTimeout(function () {
                 container.children('span').hide();
            }, 500)

        }), container.children('span').hide();
    })
}
//$(document).ready(function () {
//    $(".recoLeftArea .Image").circulatingBorder();
//});