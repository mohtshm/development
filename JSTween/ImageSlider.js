var _currentIndex = null;
var _currentIndexFeature = null;
var imageArray = [];
var textArray = [];
var textArrayDesc = [];
var imageArrayFeature = [];
var textArrayFeature = [];
var imageAnchor = [];
var featureAnchor = [];
var istCheck = false;
var mouseOutFlag = true;
var mouseFeatureOutFlag = true;
var inProgress = false;
var rootLocation = "";
jQuery(document).ready(function () {
	var nextImage;
	var currentImage;
	var nextImageFeature;
	var currentImageFeature;
	var propertyAnchor = jQuery('<a/>');
	var featuredAnchor = jQuery('<a/>');
	_currentIndex = 0;
	_currentIndexFeature = 0;
	jQuery("#TextFeatureDiv").show();
	configureSlider();
	configureFeatureSlider();
	setSlider(_currentIndex);
	setFeatureSlider(_currentIndexFeature);
	$(".recoLeftArea .Image").circulatingBorder();
	function configureSlider() {
		nextImage = jQuery('<img/>').attr('src', imageArray[0]).css({
				border : '0',
				height : '258px',
				float : 'left',
				width : '439px'
			});
		currentImage = jQuery('<img/>').attr('src', imageArray[imageArray.length > 1 ? 1 : 0]).css({
				border : '0',
				height : '258px',
				float : 'left',
				width : '439px'
			});
		jQuery("#ImageSlider").append(jQuery(nextImage)).append(jQuery(currentImage));
	}
	function configureFeatureSlider() {
		nextImageFeature = jQuery('<img/>').attr('src', imageArrayFeature[0]).css({
				border : '0',
				height : '258px',
				float : 'left',
				width : '439px'
			});
		currentImageFeature = jQuery('<img/>').attr('src', imageArrayFeature[1]).css({
				border : '0',
				height : '258px',
				float : 'left',
				width : '439px'
			});
		jQuery("#ImageFeatureSlider").append(jQuery(nextImageFeature)).append(jQuery(currentImageFeature));
	}
	jQuery("#NextImage").click(function () {
		if (!inProgress) {
			inProgress = true;
		} else {
			return;
		}
		_currentIndex = (_currentIndex < imageArray.length - 1) ? _currentIndex + 1 : 0;
		var nextIndex = _currentIndex == 0 ? imageArray.length - 1 : _currentIndex - 1;
		var currentIndex = _currentIndex;
		jQuery(nextImage).attr('src', imageArray[nextIndex]);
		jQuery(currentImage).attr('src', imageArray[currentIndex]);
		//TweenLite.to(jQuery(nextImage).stop(true, true).css({
		//    position: "relative",
		//    left: "-11px"
		//}), 1, { left: "-439px" });
		jQuery(nextImage).stop(true, true).css({
			position : "relative",
			left : "-11px"
		}).animate({
			left : -439
		}, 2000, function () {
			inProgress = false;
		});
		jQuery(currentImage).stop(true, true).css({
			position : "relative",
			left : "-11px"
		}).animate({
			left : -439
		}, 1000, function () {
			inProgress = false;
		});
		setSlider(_currentIndex);
	});
	jQuery("#PrevImage").click(function () {
		if (!inProgress) {
			inProgress = true;
		} else {
			return;
		}
		_currentIndex = (_currentIndex == 0) ? imageArray.length - 1 : _currentIndex - 1;
		var nextIndex = _currentIndex;
		var currentIndex = _currentIndex == imageArray.length - 1 ? 0 : _currentIndex + 1;
		jQuery(nextImage).attr('src', imageArray[nextIndex]);
		jQuery(currentImage).attr('src', imageArray[currentIndex]);
		//alert(jQuery(nextImage).css());
		jQuery(nextImage).stop(true, true).css({
			position : "relative",
			left: '-439px',
			'z-index': '1'
		}).animate({
		    left: '-11px'
		}, 1000, function () {
		//	inProgress = false;
		});
		jQuery(currentImage).stop(true, true).css({
			position : 'relative',
			left: '-439px'
		}).animate({
		    left: '-11px'
		}, 1500, function () {
		    inProgress = false;
		    jQuery(nextImage).css({ 'z-index': '0' });
		});
		setSlider(_currentIndex);
	});
	jQuery("#NextFeatureImage").click(function () {
		if (!inProgress) {
			inProgress = true;
		} else {
			return;
		}
		_currentIndexFeature = (_currentIndexFeature < imageArrayFeature.length - 1) ? _currentIndexFeature + 1 : 0;
		var nextIndexFeature = _currentIndexFeature == 0 ? imageArrayFeature.length - 1 : _currentIndexFeature - 1;
		var currentIndexFeature = _currentIndexFeature;
		jQuery(nextImageFeature).attr('src', imageArrayFeature[nextIndexFeature]);
		jQuery(currentImageFeature).attr('src', imageArrayFeature[currentIndexFeature]);
		jQuery(nextImageFeature).stop(true, true).css({
			position : "relative",
			left : "-11px"
		}).animate({
			left : -439
		}, 1000, function () {
			inProgress = false;
		});
		jQuery(currentImageFeature).stop(true, true).css({
			position : "relative",
			left : "-11px"
		}).animate({
			left : -439
		}, 1000, function () {
			inProgress = false;
		});
		setFeatureSlider(_currentIndexFeature);
	});
	jQuery("#PrevFeatureImage").click(function () {
		if (!inProgress) {
			inProgress = true;
		} else {
			return;
		}
		_currentIndexFeature = (_currentIndexFeature == 0) ? imageArrayFeature.length - 1 : _currentIndexFeature - 1;
		var nextIndexFeature = _currentIndexFeature;
		var currentIndexFeature = _currentIndexFeature == imageArrayFeature.length - 1 ? 0 : _currentIndexFeature + 1;
		jQuery(nextImageFeature).attr('src', imageArrayFeature[nextIndexFeature]);
		jQuery(currentImageFeature).attr('src', imageArrayFeature[currentIndexFeature]);
		jQuery(nextImageFeature).stop(true, true).css({
			position : "relative",
			left : '-439px'
		}).animate({
			left : '-11px'
		}, 1000, function () {
			inProgress = false;
		});
		jQuery(currentImageFeature).stop(true, true).css({
			position : "relative",
			left : '-439px'
		}).animate({
			left : '-11px'
		}, 1000, function () {
			inProgress = false;
		});
		setFeatureSlider(_currentIndexFeature);
	});
	jQuery("#ImageFeatureMain").hover(function () {
		mouseFeatureOutFlag = false;
		ControlSlideUpFeature(jQuery('#TextFeatureDiv'));
		jQuery("#ImageFeatureMain").css({
			'cursor' : 'default'
		});
	}, function () {
		mouseFeatureOutFlag = true;
		ControlSlideDown(jQuery('#TextFeatureDiv'));
		jQuery("#ImageFeatureMain").css({
			'cursor' : 'default'
		});
	});
	jQuery("#NextFeatureImage").hover(function () {
		setFeatureHover('Next', true);
	}, function () {
		setFeatureHover('Next', false);
	});
	jQuery("#PrevFeatureImage").hover(function () {
		setFeatureHover('Prev', true);
	}, function () {
		setFeatureHover('Prev', false);
	});
	currentImage.click(function () {
		postLink(imageAnchor[_currentIndex]);
	});
	jQuery("#sliderText").click(function () {
		postLink(imageAnchor[_currentIndex]);
	});
	jQuery("#sliderText").hover(function () {
		jQuery("#sliderText").css({
			'text-decoration' : 'underline',
			'cursor' : 'pointer'
		});
	}, function () {
		jQuery("#sliderText").css({
			'text-decoration' : 'none'
		});
	});
	nextImage.click(function () {
		postLink(imageAnchor[_currentIndex]);
	});
	currentImageFeature.click(function () {
		postFeatureLink(featureAnchor[_currentIndexFeature]);
	});
	nextImageFeature.click(function () {
		postFeatureLink(featureAnchor[_currentIndexFeature]);
	});
	jQuery("#SliderFeatureText").click(function () {
		postFeatureLink(featureAnchor[_currentIndexFeature]);
	});
	jQuery("#SliderFeatureText").hover(function () {
		jQuery("#SliderFeatureText").css({
			'text-decoration' : 'underline',
			'cursor' : 'pointer'
		});
	}, function () {
		jQuery("#SliderFeatureText").css({
			'text-decoration' : 'none'
		});
	});
	jQuery("#ImageFeatureSlider").hover(function () {
		jQuery("#ImageFeatureSlider").css({
			'cursor' : 'pointer'
		});
	}, function () {
		jQuery("#ImageFeatureSlider").css({
			'cursor' : 'pointer'
		});
	});
	jQuery("#ImageFeatureSlider").hover(function () {
		jQuery("#ImageSlider").css({
			'cursor' : 'pointer'
		});
	}, function () {
		jQuery("#ImageSlider").css({
			'cursor' : 'pointer'
		});
	});
	jQuery("#NextImage").hover(function () {
		setHover('Next', true);
	}, function () {
		setHover('Next', false);
	});
	jQuery("#PrevImage").hover(function () {
		setHover('Prev', true);
	}, function () {
		setHover('Prev', false);
	});
});
function setSlider(indexSet) {
	jQuery("#sliderText").text(textArray[indexSet]);
	jQuery("#DescriptionTexDiv").text(textArrayDesc[indexSet]);
	if (indexSet == imageArray.length - 1) {
		jQuery("#imageNext").attr('src', imageArray[0]);
		jQuery("#imagePrev").attr('src', imageArray[indexSet - 1]);
	} else if (indexSet == 0) {
		jQuery("#imageNext").attr('src', imageArray[indexSet + 1]);
		jQuery("#imagePrev").attr('src', imageArray[imageArray.length - 1]);
	} else {
		jQuery("#imageNext").attr('src', imageArray[indexSet + 1]);
		jQuery("#imagePrev").attr('src', imageArray[indexSet - 1]);
	}
}
function setFeatureSlider(indexSet) {
	jQuery("#SliderFeatureText").text(textArrayFeature[indexSet]);
	if (indexSet == imageArrayFeature.length - 1) {
		jQuery("#imageFeatureNext").attr('src', imageArrayFeature[0]);
		jQuery("#imageFeaturePrev").attr('src', imageArrayFeature[indexSet - 1]);
	} else if (indexSet == 0) {
		jQuery("#imageFeatureNext").attr('src', imageArrayFeature[indexSet + 1]);
		jQuery("#imageFeaturePrev").attr('src', imageArrayFeature[imageArrayFeature.length - 1]);
	} else {
		jQuery("#imageFeatureNext").attr('src', imageArrayFeature[indexSet + 1]);
		jQuery("#imageFeaturePrev").attr('src', imageArrayFeature[indexSet - 1]);
	}
}
function setHover(controlName, flag) {
	var fromLeft = controlName.toLocaleLowerCase() == 'next' ? '123px' : '-75px';
	var toLeft = controlName.toLocaleLowerCase() == 'next' ? '-11px' : '48px';
	if (!istCheck) {
		istCheck = true;
		jQuery("#PrevInnerImg").show();
		jQuery("#PrevInnerImg").stop(true, true).css({
			position : "relative",
			left : '48px'
		}).animate({
			left : '-75px'
		}, 1);
		jQuery("#NextInnerImg").show();
		jQuery("#NextInnerImg").stop(true, true).css({
			position : "relative",
			left : '-11px'
		}).animate({
			left : '123px'
		}, 1);
	}
	jQuery("#" + controlName + "Image")[0].className = controlName + "ImageDiv" + (flag ? "-h" : "");
	jQuery("#" + controlName + "InnerImg")[0].className = controlName + "InnerImageDiv" + (flag ? "-h" : "");
	if (flag) {
		jQuery("#" + controlName + "InnerImg").stop(true, true).css({
			position : "relative",
			left : fromLeft
		});
		jQuery("#" + controlName + "InnerImg").animate({
			left : toLeft
		}, 500, function () {
			ControlSlideDown(jQuery('#TextDiv'));
		});
	} else {
		jQuery("#" + controlName + "InnerImg").stop(true, true).css({
			position : "relative",
			left : toLeft
		}).animate({
			left : fromLeft
		}, 500, function () {
			ControlSlideUp(jQuery('#TextDiv'));
		});
	}
}
function setFeatureHover(controlName, flag) {
	var fromLeft = controlName.toLocaleLowerCase() == 'next' ? '123px' : '-75px';
	var toLeft = controlName.toLocaleLowerCase() == 'next' ? '-11px' : '48px';
	if (!istCheck) {
		istCheck = true;
		jQuery("#PrevFeatureInnerImg").show();
		jQuery("#PrevFeatureInnerImg").stop(true, true).css({
			position : "relative",
			left : '48px'
		}).animate({
			left : '-75px'
		}, 1);
		jQuery("#NextFeatureInnerImg").show();
		jQuery("#NextFeatureInnerImg").stop(true, true).css({
			position : "relative",
			left : '-11px'
		}).animate({
			left : '123px'
		}, 1);
	}
	jQuery("#" + controlName + "FeatureImage")[0].className = controlName + "ImageDiv" + (flag ? "-h" : "");
	jQuery("#" + controlName + "FeatureInnerImg")[0].className = controlName + "InnerImageDiv" + (flag ? "-h" : "");
	if (flag) {
		jQuery("#" + controlName + "FeatureInnerImg").stop(true, true).css({
			position : "relative",
			left : fromLeft
		});
		jQuery("#" + controlName + "FeatureInnerImg").animate({
			left : toLeft
		}, 500, function () {
			ControlSlideDown(jQuery('#TextFeatureDiv'));
		});
	} else {
		jQuery("#" + controlName + "FeatureInnerImg").stop(true, true).css({
			position : "relative",
			left : toLeft
		}).animate({
			left : fromLeft
		}, 500, function () {
			ControlSlideUpFeature(jQuery('#TextFeatureDiv'));
		});
	}
}
function ControlSlideDown(control) {}
function ControlSlideUp(control) {}
function ControlSlideUpFeature(control) {}
function postLink(urlToJump) {
	window.location = urlToJump;
}
function postFeatureLink(urlToJump) {
	window.location = urlToJump;
}