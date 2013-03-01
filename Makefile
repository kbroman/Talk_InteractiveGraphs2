mainstuff: js presentation.html figs/manyboxplots.png figs/manyboxplots_oldschool.png

js: js/manyboxplots.js js/lod_and_effect.js

js/manyboxplots.js: coffee/manyboxplots.coffee
	coffee -bco js coffee

js/lod_and_effect.js: coffee/lod_and_effect.coffee
	coffee -bco js coffee

figs/manyboxplots.png: R/hypo_boxplot.R
	cd R;R CMD BATCH hypo_boxplot.R

figs/manyboxplots_oldschool.png: R/hypo_boxplot_oldschool.R
	cd R;R CMD BATCH hypo_boxplot_oldschool.R

presentation.html: index.html js css/kbroman_talk.css css/kbroman_presentation.css
	Perl/create_presentation.pl

webmain:
	scp index.html presentation.html broman-2:public_html/presentations/InteractiveGraphs2/

webcss:
	scp css/*.css broman-2:public_html/presentations/InteractiveGraphs2/css/

webcode:
	scp js/*.js broman-2:public_html/presentations/InteractiveGraphs2/js/
	scp coffee/*.coffee broman-2:public_html/presentations/InteractiveGraphs2/coffee/

webdata:
	scp data/*.json broman-2:public_html/presentations/InteractiveGraphs2/data/

webfigs:
	scp figs/*.png broman-2:public_html/presentations/InteractiveGraphs2/figs/
	scp figs/*.jpg broman-2:public_html/presentations/InteractiveGraphs2/figs/

web: webmain webcss webcode webfigs webdata

all: js web presentation.html
