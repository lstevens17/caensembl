=head1 LICENSE

Copyright [1999-2014] Wellcome Trust Sanger Institute and the EMBL-European Bioinformatics Institute

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

=cut

package EnsEMBL::Web::Component::Info::SpeciesBlurb;

use strict;

use EnsEMBL::Web::Controller::SSI;
use EnsEMBL::Web::Document::Table;

use base qw(EnsEMBL::Web::Component::Shared);


sub _init {
  my $self = shift;
  $self->cacheable(0);
  $self->ajaxable(0);
}

sub content {
  my $self              = shift;
  my $hub               = $self->hub;
  my $species_defs      = $hub->species_defs;
  my $species           = $hub->species;
  my $path              = $hub->species_path;
  my $common_name       = $species_defs->SPECIES_COMMON_NAME;
  my $display_name      = $species_defs->SPECIES_SCIENTIFIC_NAME;
  my $ensembl_version   = $species_defs->ENSEMBL_VERSION;
  my $current_assembly  = $species_defs->ASSEMBLY_NAME;
  my $accession         = $species_defs->ASSEMBLY_ACCESSION;
  my $source            = $species_defs->ASSEMBLY_ACCESSION_SOURCE || 'NCBI';
  my $source_type       = $species_defs->ASSEMBLY_ACCESSION_TYPE;
  my $previous          = $current_assembly;

###
# BEGIN LEPBASE MODIFICATIONS...
  my $html = qq(
<div class="column-wrapper">  
  <div class="column-one">
    <div class="column-padding no-left-margin">
      <h1 class="no-bottom-margin">Assembly and gene annotation</h1>
    </div>
  </div>
</div>
          );
# ...END LEPBASE MODIFICATIONS
###
  $html .= '
<div class="column-wrapper">  
  <div class="column-two">
    <div class="column-padding no-left-margin">';
### ASSEMBLY
  $html .= '<h2 id="assembly">Assembly</h2>';
  $html .= EnsEMBL::Web::Controller::SSI::template_INCLUDE($self, "/ssi/species/${species}_assembly.html");

  
  $html .= '<p>The assembly plot above is a representation of genome assembly quality which condenses a number of key metrics into a single scale independent visualisation.
  <ul>
    <li>The green bar in the upper left indicates the size of the full assembly relative to the longest scaffold</li>
    <li>The radius of the circular plot represents the length of the longest scaffold in the assembly</li>
    <li>The angle subtended by the first (red) segment within this plot indicates the percentage of the assembly that is in the longest scaffold</li>
    <li>The radial axis originates at the circumference and indicates scaffold length</li>
    <li>Subsequent (grey) segments are plotted from the circumference and the length of segment at a given percentage indicates the cumulative percentage of the assembly that is contained within scaffolds of at least that length</li>
    <li>The N50 and N90 scaffold lengths are indicated respectively by dark and light orange arcs that connect to the radial axis for ease of comparison</li>
    <li>The cumulative number of scaffolds within a given percentge of the genome is plotted in purple originating at the centre of the plot</li>
    <li>White scale lines are drawn at successive orders of magnitude from 10 scaffolds onwards</li>
    <li>The plot in the lower right indicates the percentage base composition of the assembly: ACGT = light blue; GC = dark blue; N = grey</li>
  </ul>
  </p>'; 
  $html .= sprintf '<p>The genome assembly represented here corresponds to %s %s</p>', $source_type, $hub->get_ExtURL_link($accession, "ASSEMBLY_ACCESSION_SOURCE_$source", $accession) if $accession; ## Add in GCA link
  
  $html .= '<h2 id="genebuild">Gene annotation</h2>';
  $html .= EnsEMBL::Web::Controller::SSI::template_INCLUDE($self, "/ssi/species/${species}_annotation.html");

  ## Link to Wikipedia
  $html .= $self->_wikipedia_link; 
  
  $html .= '
    </div>
  </div>
  <div class="column-two">
    <div class="column-padding" style="margin-left:16px">';
    
  ## ASSEMBLY STATS 
  my $file = '/ssi/species/stats_' . $self->hub->species . '.html';
  $html .= '<h2>Statistics</h2>';
  $html .= EnsEMBL::Web::Controller::SSI::template_INCLUDE($self, $file);

  $html .= '
    </div>
  </div>
</div>';

  return $html;  
}

sub _wikipedia_link {
## Factored out so that other sites can override it easily
  my $self = shift;
  my $species = $self->hub->species;
  my $html = qq(<h2>More information</h2>
<p>General information about this species can be found in 
<a href="http://en.wikipedia.org/wiki/$species" rel="external">Wikipedia</a>.
</p>); 

  return $html;
}

1;
