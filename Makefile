mainstuff: js presentation.html figs/manyboxplots.png figs/manyboxplots_oldschool.png

js: js/manyboxplots.js

js/manyboxplots.js: coffee/manyboxplots.coffee
	coffee -bco js coffee

figs/manyboxplots.png: R/hypo_boxplot.R
	cd R;R CMD BATCH hypo_boxplot.R

figs/manyboxplots_oldschool.png: R/hypo_boxplot_oldschool.R
	cd R;R CMD BATCH hypo_boxplot_oldschool.R

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

webmain:
	scp index.html presentation.html adhara:public_html/presentations/InteractiveGraphs2/

webcss:
	scp css/*.css adhara:public_html/presentations/InteractiveGraphs2/css/

webcode:
	scp js/*.js adhara:public_html/presentations/InteractiveGraphs2/js/
	scp coffee/*.coffee adhara:public_html/presentations/InteractiveGraphs2/coffee/

webdata:
	scp data/*.json adhara:public_html/presentations/InteractiveGraphs2/data/

webex:
	scp examples/*.png adhara:public_html/presentations/InteractiveGraphs2/examples/
	scp examples/*.html adhara:public_html/presentations/InteractiveGraphs2/examples/

web: webmain webcss webcode webex webdata

all: js web presentation.html
