# A plugin for showing modified dates for specified files and index-templates.
#
# $Id$
#
# This software is provided as-is. You may use it for commercial or 
# personal use. If you distribute it, please keep this notice intact.
#
# Copyright (c) 2007 Hirotaka Ogawa
#
package MT::Plugin::ModifiedDate;
use strict;
use MT;
use base 'MT::Plugin';
use vars qw($VERSION);

use MT::Template::Context;
use MT::Util;

sub BEGIN {
    $VERSION = '0.01';
    my $plugin = __PACKAGE__->new({
	name => 'ModifiedDate',
	description => 'A plugin for showing modified dates for specified files and index-templates.',
	doc_link => 'http://code.as-is.net/wiki/ModifiedDate_Plugin',
	author_name => 'Hirotaka Ogawa',
	author_link => 'http://profile.typekey.com/ogawa/',
	version => $VERSION,
    });
    MT->add_plugin($plugin);
    MT::Template::Context->add_tag(ModifiedDate => \&modified_date);
};

sub modified_date {
    my ($ctx, $args) = @_;
    my $file;
    if ($args->{file}) {
	$file = $args->{file};
    } elsif (my $tmpl_name = $args->{template}) {
	require MT::Template;
	my $tmpl = MT::Template->load({ name => $tmpl_name,
					type => 'index',
					blog_id => $ctx->stash('blog_id') })
	    or return $ctx->error(MT->translate("Can't find template '[_1]'", $tmpl_name));
	$file = $tmpl->outfile;
    }
    return unless $file;

    my $blog = $_[0]->stash('blog');

    my @paths = map { File::Spec->catfile($_, $file) }
	($blog->site_path, $blog->archive_path, '');
    my $path;
    for my $p (@paths) {
	$path = $p, last if -e $p && -r _;
    }
    return $_[0]->error(MT->translate("Can't find file '[_1]'", $file)) unless $path;
    my ($mtime) = (stat($path))[9];
    $args->{ts} = MT::Util::epoch2ts($blog, $mtime);
    MT::Template::Context::_hdlr_date($ctx, $args);
}

1;
