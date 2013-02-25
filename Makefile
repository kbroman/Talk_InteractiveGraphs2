mainstuff: js presentation.html examples/manyboxplots.png

js: js/plotframe.js js/scatterplot.js js/density.js

js/plotframe.js: coffee/plotframe.coffee
	coffee -bco js coffee

js/scatterplot.js: coffee/scatterplot.coffee
	coffee -bco js coffee

js/density.js: coffee/density.coffee
	coffee -bco js coffee

examples/manyboxplots.png: R/hypo_boxplot.R
	cd R;R CMD BATCH hypo_boxplot.R

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

webmain:
	scp index.html presentation.html adhara:public_html/presentations/DynamicGraphs/

webcss:
	scp css/*.css adhara:public_html/presentations/DynamicGraphs/css/

webcode:
	scp js/*.js adhara:public_html/presentations/DynamicGraphs/js/
	scp coffee/*.coffee adhara:public_html/presentations/DynamicGraphs/coffee/

webdata:
	scp data/*.json adhara:public_html/presentations/DynamicGraphs/data/

webex:
	scp examples/*.png adhara:public_html/presentations/DynamicGraphs/examples/
	scp examples/*.html adhara:public_html/presentations/DynamicGraphs/examples/

web: webmain webcss webcode webex webdata

all: js web presentation.html
