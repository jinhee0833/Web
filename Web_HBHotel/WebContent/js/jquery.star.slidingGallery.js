/*
* original ------------------0------------------------------------------------------------------------------------------------------------------------------
*       Developed by Justin Mead
*       ©2009 MeadMiracle
*		www.meadmiracle.com / meadmiracle@gmail.com
*       Version 1.0
*       Testing: IE7/Windows XP
*                Firefox/Windows XP
*       Licensed under the Creative Commons GPL http://creativecommons.org/licenses/GPL/2.0/
*
*       OPTIONS LISTING:
*           *Pheight, Pwidth            - the height and width to use for the center image (portrait)
*           *Pshrink                    - the function to use when shrinking an image to a smaller size.  must take in and return an integer value. (portrait)
*           *defaultLayout              - the layout attribute to apply when the image has no layout attribute
*           *startClass                 - the class label of the image to place in the center slot at the start of the gallery
*           *slideSpeed                 - the animation speed of sliding. use jQuery animation speed values
*           *gutterWidth                - the horizontal distance between each of the images. use a pixel value
*
* edit by Star Kim ----------------------------------------------------------------------------------------------------------------------------------------
* 2011.2.21 Edit by Star Kim for minkmui
* 5개의 세로 이미지 갤러리 형식으로 수정되었으며 버튼과 콜백함수가 추가 되었습니다.
* Testing: IE6,IE7, IE8/Windows 7
*          Firefox/Windows 7
*          Crome/Windows 7
*          Safari/Windows 7
*
*           *buttonLeftPath             - the path of left button
*           *buttonRightPath            - the path of right button
*           *buttonDivHeight            - 
*           *buttonDivTop               -
*           *buttonWidth                - the width of button
*           *buttonHeight               - the height of button
*           *buttonLeftID               - the id of left button
*           *buttonRightID              - the id of right button
*           *buttonLeftPadding          -        
*           *buttonRightPadding         -
*           *callback                   - 센터 이미지가 위치했을때 센터 img element를 반환 합니다.
*       All options have default values, and as such, are optional.  Check the 'options' JSON object below to see the defaults.
*/

(function ($) {
    $.galleryUtility = {};
    $.galleryUtility.centerImage = {};
    $.galleryUtility.rightImage = {};
    $.galleryUtility.rightRightImage = {};
    $.galleryUtility.leftImage = {};
    $.galleryUtility.leftLeftImage = {};
    $.galleryUtility.rightImageStorage = {};
    $.galleryUtility.leftImageStorage = {};
    $.galleryUtility.gallery = {};

    $.galleryUtility.Options = {
        container: null,
        Pheight: 320,
        Pwidth: 240,
        Pshrink:
                        function (dimension) {
                            return dimension * 0.25;
                        },
        defaultLayout: 'portrait',
        startClass: 'start',
        slideSpeed: 'normal',
        gutterWidth: 20,

        buttonLeftPath: 'Images/SlidingGallery/allow_l.png',
        buttonRightPath: 'Images/SlidingGallery/allow_r.png',
        buttonDivHeight: 500,
        buttonDivTop: 250,
        buttonWidth: 15,
        buttonHeight: 22,
        buttonLeftID: 'buttonLeft',
        buttonRightID: 'buttonRight',
        buttonLeftPadding: 45,
        buttonRightPadding: 831,
        callback: null
    };

    $.fn.slidingGallery = function (options) {
        //global settings
        $.extend($.galleryUtility.Options, options);
        //eliminate overflow
        $('body').css('overflow-x', 'hidden');
        var container = null;
        if (!$.galleryUtility.Options.container) {
            $.galleryUtility.Options.container = $('body');
        } else {
            $.galleryUtility.Options.container.css('position', 'relative');
        }
        $.galleryUtility.gallery = $(this).css('cursor', 'pointer');
        $.galleryUtility.definePositions();

        //setup existing images
        var lastIndex = 0;
        var gallerySize = $.galleryUtility.gallery.each(function (i) {
            $(this).attr({
                'index': i,
                'prev': (i - 1),
                'next': (i + 1),
                'prevPrev': (i - 2),
                'nextNext': (i + 2)
            }).css('position', 'absolute');
            if (($(this).attr('layout') !== 'portrait') && ($(this).attr('layout') !== 'landscape')) {
                $(this).attr('layout', $.galleryUtility.Options.defaultLayout);
            }
            lastIndex = i;
        }).hide().size();

        //fill in gallery with duplicates until there are at least 7
        var currIndex = 0;
        while (gallerySize < 7) {
            var $clone = $.galleryUtility.gallery.filter('[index=' + currIndex + ']').clone().attr({
                'index': lastIndex + 1,
                'prev': lastIndex,
                'next': lastIndex + 2,
                'prevPrev': lastIndex - 1,
                'nextNext': lastIndex + 3
            }).removeClass($.galleryUtility.Options.startClass);
            $.galleryUtility.gallery.filter('[index=' + (lastIndex) + ']').after($clone);
            $.galleryUtility.gallery = $.galleryUtility.gallery.add('img[index=' + (lastIndex + 1) + ']');
            lastIndex++;
            currIndex++;
            gallerySize++;
        }
        $.galleryUtility.gallery.filter('[index=' + lastIndex + ']').attr('next', 0);
        $.galleryUtility.gallery.filter('[index=0]').attr('prev', lastIndex);

        //set images
        $.galleryUtility.setCenter($.galleryUtility.gallery.filter('.' + $.galleryUtility.Options.startClass).show());
        $.galleryUtility.setLeft($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.centerImage.image.attr('prev') + ']').show());
        $.galleryUtility.setRight($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.centerImage.image.attr('next') + ']').show());
        $.galleryUtility.setLeftLeft($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.centerImage.image.attr('prevPrev') + ']').show());
        $.galleryUtility.setRightRight($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.centerImage.image.attr('nextNext') + ']').show());

        $.galleryUtility.setLeftStorage($.galleryUtility.gallery.filter('[index=' + lastIndex + ']'));
        $.galleryUtility.setRightStorage($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.rightRightImage.image.attr('next') + ']'));

        ////set button images
        //$.galleryUtility.Options.container.append('<div id="buttonDiv" style="position:relative;z-index:1000;height:' + $.galleryUtility.Options.buttonDivHeight + ';width:500px;left:40px;top:0px;"></div>');
        $.galleryUtility.Options.container.append('<div id="leftButtonArea" style="position:absolute;z-index:1000;left:' + $.galleryUtility.Options.buttonLeftPadding + 'px;top:' + ($.galleryUtility.Options.buttonDivHeight - (parseFloat($.galleryUtility.Options.buttonHeight) / 2)) + 'px;"></div>');
        $.galleryUtility.Options.container.append('<div id="rightButtonArea" style="position:absolute;z-index:1000;left:' + $.galleryUtility.Options.buttonRightPadding + 'px;top:' + ($.galleryUtility.Options.buttonDivHeight - (parseFloat($.galleryUtility.Options.buttonHeight) / 2)) + 'px;"></div>');
        $("#leftButtonArea").append('<img src="' + $.galleryUtility.Options.buttonLeftPath + '" style="width: ' + $.galleryUtility.Options.buttonWidth + '; display: block; border-width:0px;"' + 'id="' + $.galleryUtility.Options.buttonLeftID + '" alt="left button" />');
        $("#rightButtonArea").append('<img src="' + $.galleryUtility.Options.buttonRightPath + '" style="width: ' + $.galleryUtility.Options.buttonWidth + '; display: block; border-width:0px;"' + 'id="' + $.galleryUtility.Options.buttonRightID + '" alt="right button" />');

        $('#' + $.galleryUtility.Options.buttonLeftID + ',#' + $.galleryUtility.Options.buttonRightID).css('cursor', 'pointer');

        //bind events
        $('#' + $.galleryUtility.Options.buttonLeftID).bind('click', $.galleryUtility.slideRight);
        $('#' + $.galleryUtility.Options.buttonRightID).bind('click', $.galleryUtility.slideLeft);

        //return the objects (for chaining purposes)
        return $(this);
    };

    $.galleryUtility.slideRight = function () {
        var lliLeft = $.galleryUtility.leftLeftImage.Pleft;
        var liLeft = $.galleryUtility.leftImage.Pleft;
        var riLeft = $.galleryUtility.rightImage.Pleft;
        var rriLeft = $.galleryUtility.rightRightImage.Pleft;
        var risLeft = $.galleryUtility.rightImageStorage.left;


        $.galleryUtility.leftImageStorage.image.animate({
            'top': $.galleryUtility.leftLeftImage.Ptop,
            'left': lliLeft,
            'height': $.galleryUtility.leftLeftImage.Pheight,
            'width': $.galleryUtility.leftLeftImage.Pwidth,
            'opacity': 'show'
        });

        $.galleryUtility.leftLeftImage.image.animate({
            'top': $.galleryUtility.leftImage.Ptop,
            'left': liLeft,
            'height': $.galleryUtility.leftImage.Pheight,
            'width': $.galleryUtility.leftImage.Pwidth
        });

        $.galleryUtility.leftImage.image.animate({
            'top': $.galleryUtility.centerImage.Ptop,
            'left': $.galleryUtility.centerImage.Pleft,
            'height': $.galleryUtility.centerImage.Pheight,
            'width': $.galleryUtility.centerImage.Pwidth
        });


        $.galleryUtility.centerImage.image.animate({
            'top': $.galleryUtility.rightImage.Ptop,
            'left': riLeft,
            'height': $.galleryUtility.rightImage.Pheight,
            'width': $.galleryUtility.rightImage.Pwidth
        });

        $.galleryUtility.rightImage.image.animate({
            'top': $.galleryUtility.rightRightImage.Ptop,
            'left': rriLeft,
            'height': $.galleryUtility.rightRightImage.Pheight,
            'width': $.galleryUtility.rightRightImage.Pwidth
        });

        $.galleryUtility.rightRightImage.image.animate({
            'top': $.galleryUtility.rightImageStorage.Ptop,
            'left': risLeft,
            'height': $.galleryUtility.rightImageStorage.Pheight,
            'width': $.galleryUtility.rightImageStorage.Pwidth,
            'opacity': 'hide'
        });

        $.galleryUtility.rightImageStorage.image = $.galleryUtility.rightRightImage.image;
        $.galleryUtility.rightRightImage.image = $.galleryUtility.rightImage.image;
        $.galleryUtility.rightImage.image = $.galleryUtility.centerImage.image;
        $.galleryUtility.centerImage.image = $.galleryUtility.leftImage.image;
        $.galleryUtility.leftImage.image = $.galleryUtility.leftLeftImage.image;
        $.galleryUtility.leftLeftImage.image = $.galleryUtility.leftImageStorage.image;
        $.galleryUtility.setLeftStorage($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.leftImageStorage.image.attr('prev') + ']'));

        if (typeof $.galleryUtility.Options.callback == 'function') $.galleryUtility.Options.callback.call(this, $.galleryUtility.centerImage.image);
    };

    $.galleryUtility.slideLeft = function () {
        var rriLeft = $.galleryUtility.rightRightImage.Pleft;
        var riLeft = $.galleryUtility.rightImage.Pleft;
        var liLeft = $.galleryUtility.leftImage.Pleft;
        var lliLeft = $.galleryUtility.leftLeftImage.Pleft;
        var lisLeft = $.galleryUtility.leftImageStorage.left;

        $.galleryUtility.rightImageStorage.image.animate({
            'top': $.galleryUtility.rightRightImage.Ptop,
            'left': rriLeft,
            'height': $.galleryUtility.rightRightImage.Pheight,
            'width': $.galleryUtility.rightRightImage.Pwidth,
            'opacity': 'show'
        });

        $.galleryUtility.rightRightImage.image.animate({
            'top': $.galleryUtility.rightImage.Ptop,
            'left': riLeft,
            'height': $.galleryUtility.rightImage.Pheight,
            'width': $.galleryUtility.rightImage.Pwidth
        });

        $.galleryUtility.rightImage.image.animate({
            'top': $.galleryUtility.centerImage.Ptop,
            'left': $.galleryUtility.centerImage.Pleft,
            'height': $.galleryUtility.centerImage.Pheight,
            'width': $.galleryUtility.centerImage.Pwidth
        });

        $.galleryUtility.centerImage.image.animate({
            'top': $.galleryUtility.leftImage.Ptop,
            'left': liLeft,
            'height': $.galleryUtility.leftImage.Pheight,
            'width': $.galleryUtility.leftImage.Pwidth
        });

        $.galleryUtility.leftImage.image.animate({
            'top': $.galleryUtility.leftLeftImage.Ptop,
            'left': lliLeft,
            'height': $.galleryUtility.leftLeftImage.Pheight,
            'width': $.galleryUtility.leftLeftImage.Pwidth
        });

        $.galleryUtility.leftLeftImage.image.animate({
            'top': $.galleryUtility.leftImageStorage.Ptop,
            'left': lisLeft,
            'height': $.galleryUtility.leftImageStorage.Pheight,
            'width': $.galleryUtility.leftImageStorage.Pwidth,
            'opacity': 'hide'
        });

        $.galleryUtility.leftImageStorage.image = $.galleryUtility.leftLeftImage.image;
        $.galleryUtility.leftLeftImage.image = $.galleryUtility.leftImage.image;
        $.galleryUtility.leftImage.image = $.galleryUtility.centerImage.image;
        $.galleryUtility.centerImage.image = $.galleryUtility.rightImage.image;
        $.galleryUtility.rightImage.image = $.galleryUtility.rightRightImage.image;
        $.galleryUtility.rightRightImage.image = $.galleryUtility.rightImageStorage.image;

        $.galleryUtility.setRightStorage($.galleryUtility.gallery.filter('[index=' + $.galleryUtility.rightImageStorage.image.attr('next') + ']'));

        if (typeof $.galleryUtility.Options.callback == 'function') $.galleryUtility.Options.callback.call(this, $.galleryUtility.centerImage.image);
    };

    $.galleryUtility.setRightStorage = function (image) {
        $.galleryUtility.rightImageStorage.image = image;
        $.galleryUtility.rightImageStorage.image.hide().css({
            'top': $.galleryUtility.rightImageStorage.Ptop,
            'height': $.galleryUtility.rightImageStorage.Pheight,
            'width': $.galleryUtility.rightImageStorage.Pwidth,
            'left': $.galleryUtility.rightImageStorage.left
        });
    };

    $.galleryUtility.setLeftStorage = function (image) {
        $.galleryUtility.leftImageStorage.image = image;
        $.galleryUtility.leftImageStorage.image.hide().css({
            'top': $.galleryUtility.leftImageStorage.Ptop,
            'height': $.galleryUtility.leftImageStorage.Pheight,
            'width': $.galleryUtility.leftImageStorage.Pwidth,
            'left': $.galleryUtility.leftImageStorage.left
        });
    };

    $.galleryUtility.setCenter = function (image) {
        $.galleryUtility.centerImage.image = image;
        $.galleryUtility.centerImage.image.css({
            'top': $.galleryUtility.centerImage.Ptop,
            'left': $.galleryUtility.centerImage.Pleft,
            'height': $.galleryUtility.centerImage.Pheight,
            'width': $.galleryUtility.centerImage.Pwidth,
            'left': $.galleryUtility.centerImage.Pleft
        });
    };

    $.galleryUtility.setRight = function (image) {
        $.galleryUtility.rightImage.image = image;
        $.galleryUtility.rightImage.image.css({
            'top': $.galleryUtility.rightImage.Ptop,
            'height': $.galleryUtility.rightImage.Pheight,
            'width': $.galleryUtility.rightImage.Pwidth,
            'left': $.galleryUtility.rightImage.Pleft
        });
    };

    $.galleryUtility.setLeft = function (image) {
        $.galleryUtility.leftImage.image = image;
        $.galleryUtility.leftImage.image.css({
            'top': $.galleryUtility.leftImage.Ptop,
            'height': $.galleryUtility.leftImage.Pheight,
            'width': $.galleryUtility.leftImage.Pwidth,
            'left': $.galleryUtility.leftImage.Pleft
        });
    };

    $.galleryUtility.setRightRight = function (image) {
        $.galleryUtility.rightRightImage.image = image;
        $.galleryUtility.rightRightImage.image.css({
            'top': $.galleryUtility.rightRightImage.Ptop,
            'height': $.galleryUtility.rightRightImage.Pheight,
            'width': $.galleryUtility.rightRightImage.Pwidth,
            'left': $.galleryUtility.rightRightImage.Pleft
        });
    };

    $.galleryUtility.setLeftLeft = function (image) {
        $.galleryUtility.leftLeftImage.image = image;
        $.galleryUtility.leftLeftImage.image.css({
            'top': $.galleryUtility.leftLeftImage.Ptop,
            'height': $.galleryUtility.leftLeftImage.Pheight,
            'width': $.galleryUtility.leftLeftImage.Pwidth,
            'left': $.galleryUtility.leftLeftImage.Pleft
        });
    };

    $.galleryUtility.definePositions = function () {
        //var Gheight = ($.galleryUtility.Options.Gheight || $(window).height());
        //var Gwidth = ($.galleryUtility.Options.Gwidth || $(window).width());
        var container = $.galleryUtility.Options.container;
        if (container[0].tagName == 'BODY') {
            container = $(window);
        }
        var Gheight = container.height();
        var Gwidth = container.width();


        $.galleryUtility.centerImage.Pheight = Math.round($.galleryUtility.Options.Pheight);
        $.galleryUtility.centerImage.Pwidth = Math.round($.galleryUtility.Options.Pwidth);
        $.galleryUtility.centerImage.Ptop = Math.round((Gheight / 2) - ($.galleryUtility.centerImage.Pheight / 2));
        $.galleryUtility.centerImage.Pleft = Math.round((Gwidth / 2) - ($.galleryUtility.centerImage.Pwidth / 2));

        $.galleryUtility.leftImage.Pwidth = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.centerImage.Pwidth));
        $.galleryUtility.leftImage.Pleft = Math.round($.galleryUtility.centerImage.Pleft - ($.galleryUtility.leftImage.Pwidth + $.galleryUtility.Options.gutterWidth));
        $.galleryUtility.leftImage.Pheight = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.centerImage.Pheight));
        $.galleryUtility.leftImage.Ptop = Math.round($.galleryUtility.centerImage.Ptop + (($.galleryUtility.centerImage.Pheight - $.galleryUtility.leftImage.Pheight) / 2));

        $.galleryUtility.leftLeftImage.Pwidth = $.galleryUtility.leftImage.Pwidth;
        $.galleryUtility.leftLeftImage.Pleft = Math.round($.galleryUtility.leftImage.Pleft - ($.galleryUtility.leftLeftImage.Pwidth + $.galleryUtility.Options.gutterWidth));
        $.galleryUtility.leftLeftImage.Pheight = $.galleryUtility.leftImage.Pheight;
        $.galleryUtility.leftLeftImage.Ptop = $.galleryUtility.leftImage.Ptop;

        $.galleryUtility.rightImage.Pleft = Math.round($.galleryUtility.centerImage.Pleft + $.galleryUtility.centerImage.Pwidth + $.galleryUtility.Options.gutterWidth);
        $.galleryUtility.rightImage.Pheight = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.centerImage.Pheight));
        $.galleryUtility.rightImage.Pwidth = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.centerImage.Pwidth));
        $.galleryUtility.rightImage.Ptop = Math.round($.galleryUtility.centerImage.Ptop + (($.galleryUtility.centerImage.Pheight - $.galleryUtility.leftImage.Pheight) / 2));

        $.galleryUtility.rightRightImage.Pwidth = $.galleryUtility.rightImage.Pwidth;
        $.galleryUtility.rightRightImage.Pleft = Math.round($.galleryUtility.rightImage.Pleft + $.galleryUtility.rightRightImage.Pwidth + $.galleryUtility.Options.gutterWidth);
        $.galleryUtility.rightRightImage.Pheight = $.galleryUtility.rightImage.Pheight;
        $.galleryUtility.rightRightImage.Ptop = $.galleryUtility.rightImage.Ptop;

        $.galleryUtility.leftImageStorage.left = Math.round($.galleryUtility.centerImage.Pleft - ($.galleryUtility.leftLeftImage.Pwidth + $.galleryUtility.leftImage.Pwidth + $.galleryUtility.Options.gutterWidth));
        $.galleryUtility.leftImageStorage.Pheight = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.leftImage.Pheight));
        $.galleryUtility.leftImageStorage.Pwidth = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.leftImage.Pwidth));
        $.galleryUtility.leftImageStorage.Ptop = Math.round($.galleryUtility.leftImage.Ptop + (($.galleryUtility.leftImage.Pheight - $.galleryUtility.leftImageStorage.Pheight) / 2));
        
        $.galleryUtility.rightImageStorage.left = $.galleryUtility.rightRightImage.left = Math.round($.galleryUtility.centerImage.Pleft + $.galleryUtility.centerImage.Pwidth + $.galleryUtility.rightImage.Pwidth + $.galleryUtility.rightRightImage.Pwidth + $.galleryUtility.Options.gutterWidth);
        $.galleryUtility.rightImageStorage.Pheight = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.rightImage.Pheight));
        $.galleryUtility.rightImageStorage.Pwidth = Math.round($.galleryUtility.Options.Pshrink($.galleryUtility.rightImage.Pwidth));
        $.galleryUtility.rightImageStorage.Ptop = Math.round($.galleryUtility.rightImage.Ptop + (($.galleryUtility.rightImage.Pheight - $.galleryUtility.rightImageStorage.Pheight) / 2));
    };
})(jQuery);