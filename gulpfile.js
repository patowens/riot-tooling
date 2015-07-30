var gulp = require('gulp');
var gutil = require('gulp-util');								// logs errs
var source = require('vinyl-source-stream'); 		// enables browserify via gulp
var browserify = require('browserify'); 				// dependency mgmt
var watchify = require('watchify'); 						// watch for changes & recompile
var server = require('gulp-server-livereload'); // reload on change
var sass = require('gulp-sass'); 								// process sass
var concat = require('gulp-concat');						// stitching
var watch = require('gulp-watch');
var riotify = require('riotify');


var bundler = watchify(browserify({
	entries: ['./src/app.js'],
	debug: true,
	cache: {},
	packageCache: {},
	fullPaths: true,
	transform: [riotify]
}));

function bundle() {
	return bundler
		.bundle()
		.pipe(source('bundle.js'))
		.pipe(gulp.dest('./build/'));
};

bundler.on('update', bundle);

gulp.task('build', function() {
	bundle();
	gulp.src('./src/index.html')
		.pipe(gulp.dest('./build/'));
});

gulp.task('sass', function() {
	gulp.src('./src/sass/**/*.scss')
		.pipe(sass().on('error', sass.logError))
		.pipe(concat('styles.css'))
		.pipe(gulp.dest('./build/'));
})

gulp.task('serve', function() {
	gulp.src('./build')
		.pipe(server({
			livereload: {
				enable: true,
			},
			open: true
		}));
});

gulp.task('watch', function() {
	gulp.watch('./src/sass/**/*.scss', ['sass']);
});

gulp.task('default', ['build', 'serve', 'sass', 'watch']);