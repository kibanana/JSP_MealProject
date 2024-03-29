<%@page import="project.meal.MealDBBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>School Meal : today</title>
<style>
body {
		font-family: "Century Gothic", 'Lato', sans-serif;
}

a {
	text-decoration: none;
}

.et-hero-tabs,
.et-slide {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    position: relative;
    background: #eee;
		text-align: center;
		padding: 0 2em;
    h1 {
        font-size: 2rem;
        margin: 0;
        letter-spacing: 1rem;
    }
    h3 {
        font-size: 1rem;
        letter-spacing: 0.3rem;
        opacity: 0.6;
    }
}

.et-hero-tabs-container {
    display: flex;
    flex-direction: row;
    position: absolute;
    bottom: 0;
    width: 100%;
    height: 70px;
    box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
    background: #fff;
    z-index: 10;
}

.et-hero-tab {
    display: flex;
    justify-content: center;
    align-items: center;
    flex: 1;
    color: #000;
    letter-spacing: 0.1rem;
		transition: all 0.5s ease;
		font-size: 0.8rem;
	  &:hover {
			color:white;
      background: rgba(102,177,241,0.8);
			transition: all 0.5s ease;
    }
}

.et-hero-tab-slider {
    position: absolute;
    bottom: 0;
    width: 0;
    height: 6px;
    background: #66B1F1;
    transition: left 0.3s ease;
}

@media (min-width: 800px) {
	.et-hero-tabs,
	.et-slide {
    h1 {
        font-size: 3rem;
    }
    h3 {
        font-size: 1rem;
    }
	}
	.et-hero-tab {
		font-size: 1rem;
	}
}
</style>

<script>
class StickyNavigation {
	
	constructor() {
		this.currentId = null;
		this.currentTab = null;
		this.tabContainerHeight = 70;
		let self = this;
		$('.et-hero-tab').click(function() { 
			self.onTabClick(event, $(this)); 
		});
		$(window).scroll(() => { this.onScroll(); });
		$(window).resize(() => { this.onResize(); });
	}
	
	onTabClick(event, element) {
		event.preventDefault();
		let scrollTop = $(element.attr('href')).offset().top - this.tabContainerHeight + 1;
		$('html, body').animate({ scrollTop: scrollTop }, 600);
	}
	
	onScroll() {
		this.checkTabContainerPosition();
    this.findCurrentTabSelector();
	}
	
	onResize() {
		if(this.currentId) {
			this.setSliderCss();
		}
	}
	
	checkTabContainerPosition() {
		let offset = $('.et-hero-tabs').offset().top + $('.et-hero-tabs').height() - this.tabContainerHeight;
		if($(window).scrollTop() > offset) {
			$('.et-hero-tabs-container').addClass('et-hero-tabs-container--top');
		} 
		else {
			$('.et-hero-tabs-container').removeClass('et-hero-tabs-container--top');
		}
	}
	
	findCurrentTabSelector(element) {
		let newCurrentId;
		let newCurrentTab;
		let self = this;
		$('.et-hero-tab').each(function() {
			let id = $(this).attr('href');
			let offsetTop = $(id).offset().top - self.tabContainerHeight;
			let offsetBottom = $(id).offset().top + $(id).height() - self.tabContainerHeight;
			if($(window).scrollTop() > offsetTop && $(window).scrollTop() < offsetBottom) {
				newCurrentId = id;
				newCurrentTab = $(this);
			}
		});
		if(this.currentId != newCurrentId || this.currentId === null) {
			this.currentId = newCurrentId;
			this.currentTab = newCurrentTab;
			this.setSliderCss();
		}
	}
	
	setSliderCss() {
		let width = 0;
		let left = 0;
		if(this.currentTab) {
			width = this.currentTab.css('width');
			left = this.currentTab.offset().left;
		}
		$('.et-hero-tab-slider').css('width', width);
		$('.et-hero-tab-slider').css('left', left);
	}
	
}

new StickyNavigation();
</script>
</head>
<body>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="meal" class="project.meal.MealDataBean" scope="request" />
<jsp:setProperty property="*" name="meal"/>


<%
	MealDBBean dbBean = new MealDBBean();
	dbBean.insertMeal(meal);
%>

<div class="et-hero-tabs-container" style="position: fixed; top: 0;">
  <a class="et-hero-tab" href="#tab-y">Yesterday</a>
  <a class="et-hero-tab" href="#tab-today">Today</a>
  <a class="et-hero-tab" href="#tab-t">Tomorrow</a>
  <span class="et-hero-tab-slider"></span>
</div>

  <!-- Main -->
  <main class="et-main">
    <section class="et-slide" id="tab-y">
      <h1>Yesterday</h1>
      <h3>Yesterday</h3>
    </section>
    <section class="et-slide" id="tab-today">
      <h1>Today</h1>
      <h3>Today</h3>
    </section>
    <section class="et-slide" id="tab-t">
      <h1>Tomorrow</h1>
      <h3>Tomorrow</h3>
    </section>
  </main>
</body>
</html>