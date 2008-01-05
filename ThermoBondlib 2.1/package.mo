within ;
import "C:/Cellier/Classes/Ece449/BondLib/BondLib.mo";


package ThermoBondLib "Modelica library for thermo-bond graph modeling"

  annotation (version="2.0",
    uses(BondLib(version="2.4"), Modelica(version="2.2.1")),
    Diagram(
      Rectangle(extent=[-100,100; 100,-100],style(
          color=0,
          thickness=2,
          fillColor=9)),
      Text(
        extent=[-70,70; 64,46],
        style(
          color=0,
          thickness=2,
          fillColor=9,
          fillPattern=1),
        string="The thermo-bond graph"),
      Text(
        extent=[-71.9,15.05; 62,-14],
        style(
          color=0,
          thickness=2,
          fillColor=9,
          fillPattern=1),
        string="domain independent"),
      Text(
        extent=[-55.8,34.1; 54,4],
        style(
          color=0,
          thickness=2,
          fillColor=9,
          fillPattern=1),
        string="offers a uniform, "),
      Text(
        extent=[-67.7,-10.85; 60,-30],
        style(
          color=0,
          thickness=2,
          fillColor=9,
          fillPattern=1),
        string="interface to modeling"),
      Text(
        extent=[-59.6,-27.8; 54,-56],
        style(
          color=0,
          thickness=2,
          fillColor=9,
          fillPattern=1),
        string="convective flows."),
      Text(
        extent=[-35.9,51.05; 26,26],
        style(
          color=0,
          thickness=2,
          fillColor=9,
          fillPattern=1),
        string="technique")),
    Icon(
      Rectangle(extent=[-100,-100; 80,50],   style(fillColor=30,
            fillPattern=
              1)),
      Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50],      style(
            fillColor=30, fillPattern=1)),
      Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70],      style(
            fillColor=30, fillPattern=1)),
      Text(
        extent=[-85,35; 65,-85],
        string="Library",
        style(color=3)),
      Text(
        extent=[-120,122; 120,73],
        string="%name",
        style(color=1))),
    Documentation(info="<html>
The <b>ThermoBondLib</b> library is designed as a graphical library for modeling convective flows using the thermo-bond graph metaphor.  This library has been created by Prof. Fran&ccedil;ois Cellier and his students.<p>

The <b>ThermoBondLib</b> library relies heavily on the regular <b>BondLib</b> library.  Most of the (red) bond graph elements are built internally from regular (black) bond graphs.  Hence the user of <b>ThermoBondLib</b> needs to load <b>BondLib</b> also.  For this reason, general remarks about graphical modeling using bond graphs don't need to be repeated here.  Novice users of <b>ThermoBondLib</b> are advised to read the manual of the <b>BondLib</b> library. <p>

<hr> <p>

<b>Main Author:</b> <p>

Prof. Dr. Fran&ccedil;ois E. Cellier <br>
Institut f&uuml;r Computational Science <br>
ETH Z&uuml;rich <br>
ETH Zentrum CAB G82.1 <br>
CH-8092 Z&uuml;rich <br>
Switzerland <p>

Phone: +41(44)632-7474 <br>
Fax: +41(44)632-1374 <br>
Email: <a href=\"mailto:FCellier@Inf.ETHZ.CH\"> FCellier@Inf.ETHZ.CH</a> <br>
URL: <a href=\"http://www.inf.ethz.ch/~fcellier/\"> http://www.inf.ethz.ch/~fcellier/</a> <p>

<hr> <p>

<b>Copyright (C) 2007-2008, Fran&ccedil;ois E. Cellier.</b> <p>

<i>The <b>ThermoBondLib</b> package is <b>free</b> software;
it can be redistributed and/or modified
under the terms of the <b>Modelica license</b>, see the license conditions
and the accompanying <b>disclaimer</b> in the documentation of package
Modelica in file \"Modelica/package.mo\".</i> <p>

<hr> <p>
</html>"));

  package UsersGuide "User's Guide"
    annotation (DocumentationClass=true, Documentation(info="<html>
<h3><font color=\"#008000\" size=5>Users Guide of Package ThermoBondLib</font></h3>
<p>
Library <b>ThermoBondLib</b> is a <b>free</b> Modelica package providing components to model convective flows in a convenient domain-independent format. This package contains the <b>users guide</b> to the library, and has the following content:
</p>
<ol>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview\">Overview of Library</a>
       gives an overview of the library.
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Versions\">Release Notes</a>
       offers a historic perspective on the development of this library.
</ol>
</html>
"));
    package Overview "Overview of Library"

      annotation (Documentation(info="<html>
This overview contains the following sections: <p>

<ol>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Introduction\">An introduction to thermo-bond graph modeling</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Connectors\">Thermo-bond graph connectors</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Bonds\">Causal and a-causal thermo-bonds</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Basic\">Basic thermo-bond graph elements</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Sensors\">Sensor elements</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Sources\">Source elements</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Examples\">Examples</a>
<li><a href=\"Modelica://ThermoBondLib.UsersGuide.Overview.Literature\">Literature</a>
</ol>
</html>
"));
      class Introduction "An introduction to thermo-bond graph modeling"

        annotation (Documentation(info="<html>
Thermo-bond graphs offer a graphical approach to modeling convective flows. <p>

Any physical system can be described by power flows.  Bond graphs offer an approach to graphically represent power flows in a system.  Each power flow can be written as the product of two adjugate variables, e.g. voltage and current in an electrical circuit or force and velocity in a mechanical system. <p>

Convective flows describe the macroscopic movement of fluids (either liquids or gases) through a system.  Convective flows are special, because the moving masses carry with them their internal energy: <p>

<b>U = T·S - p·V + g·m</b> <p>

where <b>T</b> is the temperature, <b>S</b> represents the entropy, <b>p</b> denotes pressure, <b>V</b> describes the volume, <b>g</b> stands for the Gibbs potential, and <b>m</b> captures the mass. <p>

Moving fluids carry along with them not only their mass, but also their volume and the stored heat.  Consequently, a convective flow needs to be described by three parallel bonds, one denoting heat flow, a second representing volume flow, and the third describing mass flow. <p>

In the thermo-bond graph library, these three parallel bonds were collapsed into a single vector bond, or bus bond: <p>

<img src=\"../Images/ThBG_Fig1.png\"> <p>

where <b>q</b> is used to denote volumetric flow. <p>

In the <b>ThermoBondLib</b> library, the thermo-bonds themselves are not modeled graphically (due to efficiency considerations), but most of the higher-level thermo-bond graph elements are composed graphically from regular bond graphs making use of the <b>BondLib</b> library. <p>

It is possible to model convective flows using <b>ThermoBondLib</b> in exactly the same way as <b>BondLib</b> is used to model other types of physical systems.  At the top level, a convective flow model is generally composed of a (red) thermo-bond graph only.  However underneath many of the red thermo-bond graph element models, there are hidden regular (black) bond graphs. <p>

Hence it is necessary to load the <b>BondLib</b> library always together with the <b>ThermoBondLib</b> library.
</html>
"));
      end Introduction;

      class Connectors "Thermo-bond graph connectors"

        annotation (Documentation(info="<html>
As thermo-bonds carry six physical variables, the three <i>efforts</i>, <b>T</b>, <b>p</b>, and <b>g</b>, as well as the three <i>flows</i>, <b>Sdot</i>, <b>q</b>, and <b>Mdot</b>, the thermo-bond graph connectors need to carry at least these six variables.  Yet, also the direction of positive power flow is explicitly encoded in the bond models, and thereby also in the connectors.  To this end, a (non-physical) directional variable, <b>d</b>, is associated with each thermo-bond: <p>

<img src=\"../Images/ThBG_Fig2.png\"> <p>

<b>d</b> assumes a value of <b>-1</b> at the connector, from which the bond emanates, and a value of <b>+1</b> at the  connector, where it ends. <p>

In addition, the thermo-bond graph connectors also carry the state information, i.e., the variables <b>S</i>, <b>V</b>, and <b>M</b>. <p>

Finally, the connector carries one more variable of Boolean type, <b>Exist</b>, that denotes whether the mass flowing through the connector is positive or (close to) zero.  This indicator is needed for numerical reasons, since many models operate on specific quantities, i.e., quantities per mass.  If the mass approaches zero, these specific quantities thus approach infinity. <p>

Hence the thermo-bond graph connector is an 11-tuple: <p>

<img src=\"../Images/ThBG_Fig3.png\"> <p>

<i>ThermalConductance</i> is used as the measurement unit of entropy flow rather than <i>EntropyFlowRate</i>, since that unit is not currently among the set of <b>SIunits</b> offered in the Modelica standard library.  The measurement units of thermal conductance are compatible with those of entropy flow.
</html>
"));
      end Connectors;

      class Bonds "Causal and a-causal thermo-bonds"

        annotation (Documentation(info="<html>
Modelica is perfectly capable of deciding on its own the computational causality of all equations.  Thus, models can be generated in the form of implicitly defined differential and algebraic equation (DAE) systems.  If we use the a-causal thermo-bonds, as presented so far, this is precisely, what we get. <p>

However, it may be useful to write models in their causal form, as the computational causality information may offer additional insight into the system. <p>

We can denote the side, where the three flow variables are being computed, by marking it with a vertical stroke, the so-called <i>causality stroke</i>. <p>

To this end, two additional types of bonds are being offered: <p>

<img src=\"../Images/ThBG_Fig4.png\"> <p>

In this case, the equations can be read out of the bond graph in their causal forms: <p>

<b>ThB1.<u>e</u> = ThB2.<u>e</u></b> <br>
<b>ThB3.<u>e</u> = ThB2.<u>e</u></b> <br>
<b>ThB2.<u>f</u> = ThB1.<u>f</u> - ThB3.<u>f</u></b> <p>

where <b><u>e</u></b> denotes a vector of length three of effort variables, whereas <b><u>f</u></b> represents a vector of length three of flow variables. <p>

What about the state information?  In <b>ThermoBondLib</b>, we defined that the state vector is propagated across a 0-junction in the same manner as the effort vector: <p>

<b>ThB1.<u>q</u> = ThB2.<u>q</u></b> <br>
<b>ThB3.<u>q</u> = ThB2.<u>q</u></b> <p>

where <b><u>q</u></b> denotes a vector of length three of state variables: <p>

<b>der(<u>q</u>) = <u>f</u></b> <p>

This decision is meaningful, since each 0-junction is associated with a volume of fluids, and that volume is respondible for computing the state information: <p>

<img src=\"../Images/ThBG_Fig5.png\"> <p>

In the given example, we have a volume of air, represented by a capacitive field, <b>CF</b>, as well as two air flows into and out of that volume, represented by two resistive fields, <b>RF</b>.  It is the capacitive field that computes the state information. <p>

There are no 1-junctions in thermo-bond graphs.
</html>
"));
      end Bonds;

      class Basic "Basic thermo-bond graph elements"

        annotation (Documentation(info="<html>
The most basic elements of convective flows are fluid containers.  Each fluid container is represented by a capacitive field, <b>CF</b>, that is attached to a 0-junction.  The capacitive field receives the flow information from outside and computes the values of the three effort variables.  To this end, it uses the <i>equation of state</i> to determine the pressure, the <i>caloric equation of state</i> to determine the temperature, and once pressure and temperature are known, the Gibbs potential can be computed from them.  The <b>CF</b> element also computes the state information by integration over the three flows. <p>

Contrary to other fields of physical system modeling that can be dealt with effectively by offering generic modeling elements only, convective flows require descriptions of the fluids that are being transported.  Thus, each different type of fluid ought to be represented in the library by its own <b>CF</b> element. <p>

Currently, the library contains only models of air, water, and water vapor.  The library shall be extended in the near future by substance models of different types of glycols and industrial oils. <p>

The flows between fluid containers are governed by resistive fields, the <b>RF</b> elements.  These are usually (but not always) of a more generic nature, as a pipe doesn't care what type of fluid flows through it. <p>

Some of the resistive fields are purely reactive.  They describe the equilibration of potentials between neighboring volumes. If two volumes are neighboring each other, there is a tendency for their potentials to equilibrate: <p>

<ul>
<li>Temperature is being equilibrated by diffusion.  Heat can flow between neighboring volumes without being accompanied by either volume or mass flows.  In the process of diffusion, additional entropy is being generated.  This phenomenon is described by the heat exchanger, the <b>HE</b> element.</li>

<li>Pressure is being equilibrated by volume work.  If two fluids separated by a movable membrane are at different pressures, their pressure values will equilibrate by shifting the membrane to the side of lower pressure.  Thereby volume is being traded between the two fluid containers, but this volume flow is not accompanied by a corresponding mass flow.  In the process of volume work, additional entropy is being generated.  This phenomenon is described by the pressure/volume exchanger, the <b>PVE</b> element.</li>

<li>If two different fluids at the same temperature and pressure are placed in two neighboring fluid containers that allow for mass exchange between them, the fluids have a tendency to mix.  In the process of mixing, their Gibbs potentials get equilibrated.  In the same process, additional entropy, the so-called mixing entropy, is also being produced.  This phenomenon is described by the mass exchanger, the <b>ME</b> element.</li>
</ol> <p>

Of course, all three types of potential equilibration can occur in parallel.  This is modeled by the potential equilibrator, the <b>PE</b> element. <p>

In the volume work element, we assumed that the volume of each of the two containers is allowed to change.  This may not be the case.  If the two containers are of fixed volume, then a mass flow must occur between the two containers to equilibrate the pressure.  The <b>VF</b> element models the macroscopic flow of volume that is being accompanied by equal corresponding flows of mass and heat.  This approach does not guarantee that the volume in each container remains constant, but if the containers represent segments of a pipe, the approach will work, because the \"departing\" volume will be quickly replaced by \"arriving\" volume from the other side. <p>

Yet, this model doesn't allow to describe pressure equilibration far away from equilibrium while conserving the size (volume) of the individual fluid containers.  Such an equilibration can be accomplished by measuring the volume flow through the pipe, and by shifting the same amount of volume right back through the pipe without accompanying mass flow. <p>

Then there are forced fluid flows, using either a pump or a compressor.  Such flows are modeled by the <b>FVF</b> element. <p>

Also contained in <b>ThermoBondLib</b> already is yet another \"transport\" phenomenon, namely the \"flow\" of water from its liquid phase to its gaseous phase and back by means of boiling and condensation. <p>

Boiling and condensation are first steps towards a more general approach to modeling chemical reactions.  These shall be added to the library in the future.  First attempts at modeling chemical reactions using <b>ThermoBondLib</b> were already coded successfully, but these models have not yet been included in the currently released version of the library.
</html>
"));
      end Basic;

      class Sensors "Sensor elements"

        annotation (Documentation(info="<html>
Sensor elements can either be associated with junctions or with bonds.  In <b>BondLib</b>, we chose to associate effort sensors with 0-junctions and flow sensors with 1-junctions.  Only the power sensors were associated with bonds. <p>

In <b>ThermoBondLib</b>, we chose a different approach.  Here, all sensors are associated with bonds.  Currently available are effort sensors, flow sensors, and state sensors.  Since <b>ThermoBondLib</b> offers both causal and a-causal bonds, each of these sensors comes in three varieties. <p>

Sensor elements can replace any regular thermo-bond.
</html>
"));
      end Sensors;

      class Sources "Source elements"

        annotation (Documentation(info="<html>
Source elements are never fully physical.  There are no source elements in the real world.  The use of a source element in a model simply means that the \"other side\" of the source is not being modeled. <p>

Source elements can be added easily and quickly whenever needed.  Yet they can assume many different forms.  We can have sources of temperature or pressure.  Alternatively, we might have a source of material (at given values of temperature, pressure, and Gibbs potential).  The library contains only three types of sources at the current moment, those that were required by the elements that have already been included in the library.  These are a constant temperature source, a modulated temperature source, and a modulated two-port flow source.
</html>
"));
      end Sources;

      class Examples "Examples"

        annotation (Documentation(info="<html>
The library contains currently an example section with two examples: <p>

<ol>
<li> <b>PressureCooker</b> describes the model of a pressure cooker.
<li> <b>AirBalloon</b> describes the model of an air balloon being filled from a bottle of compressed air.
<li> <b>WaterLoop</b> contains a model of a closed water loop with a forced flow of water through it.
</ol>
</html>
"));
      end Examples;

      class Literature "Literature"

        annotation (Documentation(info="<html>
<b>References:</b> <p>

<ol>
<li> Cellier, F.E. (1991), <a href=\"http://www.amazon.com/Continuous-System-Modeling-Fran%C3%A7ois-Cellier/dp/0387975020\">Continuous
     System Modeling</a>, Springer-Verlag, New York, ISBN: 0-387-97502-0, 755p.
<li> Cellier, F.E. and J. Greifeneder (2003), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Pubs/BG/icbgm_03_thbglib.pdf\">Object-Oriented
     Modeling of Convective Flows Using the Dymola Thermo-Bond-Graph Library</a>,\" <i>Proc. ICBGM'03,
     6<sup>th</sup> SCS Intl. Conf. on Bond Graph Modeling and Simulation</i>, Orlando, Florida, pp. 198-204.
<li> Greifeneder, J. (2001), <a href=\"http://www.inf.ethz.ch/~fcellier/MS/greifeneder_ms.pdf\">Modellierung thermodynamischer Phänomene
     mittels Bondgraphen</a>, Diploma Project, University of Stuttgart, Stuttgart, Germany.
<li> Greifeneder, J. and F.E. Cellier (2001a), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Pubs/BG/icbgm_01_jg1.pdf\">Modeling Convective
     Flows Using Bond Graphs</a>,\" <i>Proc. ICBGM'01, 5<sup>th</sup> SCS Intl. Conf. on Bond Graph Modeling and Simulation</i>, Phoenix,
     Arizona, pp. 276-284.
<li> Greifeneder, J. and F.E. Cellier (2001b), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Pubs/BG/icbgm_01_jg2.pdf\">Modeling Multi-Phase
     Systems Using Bond Graphs</a>,\" <i>Proc. ICBGM'01, 5<sup>th</sup> SCS Intl. Conf. on Bond Graph Modeling and Simulation</i>, Phoenix,
     Arizona, pp. 285-291.
<li> Greifeneder, J. and F.E. Cellier (2001c), \"<a href=\"http://www.inf.ethz.ch/~fcellier/Pubs/BG/ess_01.pdf\">Modeling Multi-Element Systems
     Using Bond Graphs</a>,\" <i>Proc. ESS'01, 13<sup>th</sup> European Simulation Symposium</i>, Marseille, France, pp. 758-766.
</ol>
</html>
"));
      end Literature;
    end Overview;

    package Versions "Release Notes"

      annotation (Documentation(info="<html>
This section explains the major improvements made to the library from one version to the next: <p>

<ol>
<li><a href=\"Modelica://BondLib.UsersGuide.Versions.Version_2_0\">old -> Version 2.0</a>
    (January 5, 2008)
</ol>
</html>"));
      class Version_2_0 "old -> Version 2.0 (January 5, 2008)"

        annotation (Documentation(info="<html>
<font color=red><b>ThermoBondLib 2.0</b></font> constitutes the first official release of ThermoBondLib,
a library that has been around in one form or another since 2000.  The original version
of ThermoBondLib was based on Dymola 4.0.  However, that version hadn't been documented yet and was
strictly meant to be used by my students. <p>

<ul>
<li><font color=red><b>Conversion from Dymola 4.0:</b></font> The library has been
    upgraded to the new graphical interface of Dymola 6.1.</li>

<li><font color=red><b>Documentation:</b></font> Appropriate documentation has been
    added to all modules.</li>

<li><font color=red><b>Examples:</b></font> A set of examples has been added to the
    library for improved documentation.</li>

</ol> <p>

<font color=red><b>ThermoBondLib 2.0</b></font> requires <font color=red><b>BondLib 2.4</b></font> or newer for proper execution.
</html>"));
      end Version_2_0;

    end Versions;
  end UsersGuide;

  package Interfaces
    "Connectors and partial models of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100,-100; 80,50],   style(
            color=58,
            fillColor=30,
            fillPattern=1)),
        Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50],      style(
            color=58,
            fillColor=30,
            fillPattern=1)),
        Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70],      style(
            color=58,
            fillColor=30,
            fillPattern=1)),
        Text(
          extent=[-85,35; 65,-85],
          string="Library",
          style(color=58)),
        Text(
          extent=[-120,122; 120,73],
          string="%name",
          style(color=1))),
      Window(
        x=0.45,
        y=0.01,
        width=0.44,
        height=0.65,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains the three basic thermo-bond graph connectors as well as some partial models that invoke them. <p>

The <b>ThBondCon</b> connector is the basic bi-directional thermo-bond graph connector that is used always.  The <b>eThBondCon</b> and <b>fThBondCon</b> connectors are uni-directional connectors that are only used in the definitions of the two causal bonds.
</html>"));
    connector ThBondCon "Bi-directional thermo-bond graph connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Real d "Directional variable";
      Boolean Exist "True if substance exists";

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Ellipse(extent=[-60, 60; 60, -60], style(color=41, fillColor=
                  42))),
        Icon(Ellipse(extent=[-60, 60; 60, -60], style(color=8, fillColor=42))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the basic bi-directional thermo-bond graph connector that is used everywhere, except in the definitions of the two causal bonds. <p>

The thermo-bond graph connector references eleven variables.  All variables are defined as across variables.
</html>"));
    end ThBondCon;

    connector eThBondCon "Uni-directional thermo-bond graph connector"
      input Modelica.SIunits.Temperature T "Temperature";
      input Modelica.SIunits.Pressure p "Pressure";
      input Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      output Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      output Modelica.SIunits.VolumeFlowRate q "Volume flow";
      output Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      input Modelica.SIunits.Entropy S "Entropy";
      input Modelica.SIunits.Volume V "Volume";
      input Modelica.SIunits.Mass M "Mass";
      output Real d "Directional variable";
      input Boolean Exist "True if substance exists";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Ellipse(extent=[-60, 60; 60, -60], style(color=41, fillColor=
                  42)), Text(
            extent=[-34, 34; 38, -28],
            string="e",
            style(color=49, fillColor=41))),
        Icon(Ellipse(extent=[-60, 60; 60, -60], style(color=8, fillColor=42)),
              Text(
            extent=[-34, 34; 38, -28],
            string="e",
            style(color=49, fillColor=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is one of two uni-directional themro-bond graph connectors used in the definitions of the two causal bonds. <p>

The thermo-bond graph connector references eleven variables.  All variables are defined as across variables.
</html>"));
    end eThBondCon;

    connector fThBondCon "Uni-directional thermo-bond graph connector"
      output Modelica.SIunits.Temperature T "Temperature";
      output Modelica.SIunits.Pressure p "Pressure";
      output Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      input Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      input Modelica.SIunits.VolumeFlowRate q "Volume flow";
      input Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      output Modelica.SIunits.Entropy S "Entropy";
      output Modelica.SIunits.Volume V "Volume";
      output Modelica.SIunits.Mass M "Mass";
      output Real d "Directional variable";
      output Boolean Exist "True if substance exists";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Ellipse(extent=[-60, 60; 60, -60], style(color=41, fillColor=
                  42)), Text(
            extent=[-34, 34; 38, -28],
            string="f",
            style(color=49, fillColor=41))),
        Icon(Ellipse(extent=[-60, 60; 60, -60], style(color=8, fillColor=42)),
              Text(
            extent=[-34, 34; 38, -28],
            string="f",
            style(color=49, fillColor=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is one of two uni-directional themro-bond graph connectors used in the definitions of the two causal bonds. <p>

The thermo-bond graph connector references eleven variables.  All variables are defined as across variables.
</html>"));
    end fThBondCon;

    model PassiveOnePort
      "Partial model invoking one thermo-bond graph connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bond graph connector.  It is used to describe passive OnePort elements.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = ThBondCon1.d*ThBondCon1.Sdot;
      q = ThBondCon1.d*ThBondCon1.q;
      Mdot = ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
    end PassiveOnePort;

    model ModPassiveOnePort
      "Partial model invoking one thermo-bond graph connector and one signal connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      Real s "Signal input";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bondmgraph connector and a signal connector.  It is used to describe passive modulated OnePort elements.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      Modelica.Blocks.Interfaces.RealInput InPort1 "Modulating input signal"
                                                annotation (extent=[100, -10;
            80, 10]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = ThBondCon1.d*ThBondCon1.Sdot;
      q = ThBondCon1.d*ThBondCon1.q;
      Mdot = ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
      s =InPort1;
    end ModPassiveOnePort;

    model ActiveOnePort
      "Partial model invoking one thermo-bond graph connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bond graph connector.  It is used to describe active OnePort elements.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = -ThBondCon1.d*ThBondCon1.Sdot;
      q = -ThBondCon1.d*ThBondCon1.q;
      Mdot = -ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
    end ActiveOnePort;

    model ModActiveOnePort
      "Partial model invoking one thermo-bond graph connector and one signal connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      Real s "Signal input";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bondmgraph connector and a signal connector.  It is used to describe active modulated OnePort elements.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      Modelica.Blocks.Interfaces.RealInput InPort1 "Modulating input signal"
                                                annotation (extent=[100, -10;
            80, 10]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = -ThBondCon1.d*ThBondCon1.Sdot;
      q = -ThBondCon1.d*ThBondCon1.q;
      Mdot = -ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
      s =InPort1;
    end ModActiveOnePort;

    model OneOnePort
      "Partial model invoking one thermo-bond graph connector and one regular bond graph connector as well as a Boolean signal connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      Real e "Bondgraphic effort";
      Real f "Bondgraphic flow";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bond graph connector and a regular bond graph connector.  It is used by converter junctions extracting the thermal set of variables from a thermo-bond graph connector and placing them in a regular bond graph connector.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      Modelica.Blocks.Interfaces.BooleanOutput BooleanOutPort1
        "Boolean output signal"                                 annotation (
          extent=[100, 90; 120, 110]);
      BondLib.Interfaces.BondCon BondCon1 "Thermal bond graph connector"
                                          annotation (extent=[90, -10; 110, 10]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = ThBondCon1.d*ThBondCon1.Sdot;
      q = ThBondCon1.d*ThBondCon1.q;
      Mdot = ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
      BooleanOutPort1 = Exist;
      e = BondCon1.e;
      f = BondCon1.d*BondCon1.f;
    end OneOnePort;

    model OneTwoPort
      "Partial model invoking one thermo-bond graph connector and two regular bond graph connectors as well as a Boolean signal connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      Real e1 "Bondgraphic effort";
      Real f1 "Bondgraphic flow";
      Real e2 "Bondgraphic effort";
      Real f2 "Bondgraphic flow";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bond graph connector and two regular bond graph connectors.  It is used by converter junctions extracting the thermal and volume flow set of variables from a thermo-bond graph connector and placing them in two regular bond graph connectors, one connecting heat flow, the other connecting volume flow.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      Modelica.Blocks.Interfaces.BooleanOutput BooleanOutPort1
        "Boolean output signal"                                 annotation (
          extent=[100, 90; 120, 110]);
      BondLib.Interfaces.BondCon BondCon1 "Thermal bond graph connector"
                                          annotation (extent=[90, -10; 110, 10]);
      BondLib.Interfaces.BondCon BondCon2 "Volume flow bond graph connector"
                                          annotation (extent=[-10, 90; 10, 110]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = ThBondCon1.d*ThBondCon1.Sdot;
      q = ThBondCon1.d*ThBondCon1.q;
      Mdot = ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
      BooleanOutPort1           = Exist;
      e1 = BondCon1.e;
      f1 = BondCon1.d*BondCon1.f;
      e2 = BondCon2.e;
      f2 = BondCon2.d*BondCon2.f;
    end OneTwoPort;

    model OneThreePort
      "Partial model invoking one thermo-bond graph connector and three regular bond graph connectors as well as a Boolean signal connector"
      Modelica.SIunits.Temperature T "Temperature";
      Modelica.SIunits.Pressure p "Pressure";
      Modelica.SIunits.SpecificEnthalpy g "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot "Mass flow";
      Modelica.SIunits.Entropy S "Entropy";
      Modelica.SIunits.Volume V "Volume";
      Modelica.SIunits.Mass M "Mass";
      Boolean Exist "True if substance exists";
      Real e1 "Bondgraphic effort";
      Real f1 "Bondgraphic flow";
      Real e2 "Bondgraphic effort";
      Real f2 "Bondgraphic flow";
      Real e3 "Bondgraphic effort";
      Real f3 "Bondgraphic flow";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking a single thermo-bond graph connector and three regular bond graph connectors.  It is used by converter junctions extracting the thermal, volume, and mass flow sets of variables from a thermo-bond graph connector and placing them in three regular bond graph connectors, one connecting heat flow, the second connecting volume flow, and the third connecting mass flow.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "Thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      Modelica.Blocks.Interfaces.BooleanOutput BooleanOutPort1
        "Boolean output signal"                                 annotation (
          extent=[100, 90; 120, 110]);
      BondLib.Interfaces.BondCon BondCon1 "Thermal bond graph connector"
                                          annotation (extent=[90, -10; 110, 10]);
      BondLib.Interfaces.BondCon BondCon2 "Volume flow bond graph connector"
                                          annotation (extent=[-10, 90; 10, 110]);
      BondLib.Interfaces.BondCon BondCon3 "Mass flow bond graph connector"
                                          annotation (extent=[-10, -110; 10, -
            90]);
    equation
      T = ThBondCon1.T;
      p = ThBondCon1.p;
      g = ThBondCon1.g;
      Sdot = ThBondCon1.d*ThBondCon1.Sdot;
      q = ThBondCon1.d*ThBondCon1.q;
      Mdot = ThBondCon1.d*ThBondCon1.Mdot;
      S = ThBondCon1.S;
      V = ThBondCon1.V;
      M = ThBondCon1.M;
      Exist = ThBondCon1.Exist;
      BooleanOutPort1           = Exist;
      e1 = BondCon1.e;
      f1 = BondCon1.d*BondCon1.f;
      e2 = BondCon2.e;
      f2 = BondCon2.d*BondCon2.f;
      e3 = BondCon3.e;
      f3 = BondCon3.d*BondCon3.f;
    end OneThreePort;

    model TwoPort "Partial model invoking two thermo-bond graph connectors"
      Modelica.SIunits.Temperature T1 "Temperature";
      Modelica.SIunits.Pressure p1 "Pressure";
      Modelica.SIunits.SpecificEnthalpy g1 "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot1 "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q1 "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot1 "Mass flow";
      Modelica.SIunits.Entropy S1 "Entropy";
      Modelica.SIunits.Volume V1 "Volume";
      Modelica.SIunits.Mass M1 "Mass";
      Boolean Exist1 "True if substance exists";
      Modelica.SIunits.Temperature T2 "Temperature";
      Modelica.SIunits.Pressure p2 "Pressure";
      Modelica.SIunits.SpecificEnthalpy g2 "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot2 "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q2 "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot2 "Mass flow";
      Modelica.SIunits.Entropy S2 "Entropy";
      Modelica.SIunits.Volume V2 "Volume";
      Modelica.SIunits.Mass M2 "Mass";
      Boolean Exist2 "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking two thermo-bond graph connectors.  It is used to describe TwoPort elements.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
    equation
      T1 = ThBondCon1.T;
      p1 = ThBondCon1.p;
      g1 = ThBondCon1.g;
      Sdot1 = ThBondCon1.d*ThBondCon1.Sdot;
      q1 = ThBondCon1.d*ThBondCon1.q;
      Mdot1 = ThBondCon1.d*ThBondCon1.Mdot;
      S1 = ThBondCon1.S;
      V1 = ThBondCon1.V;
      M1 = ThBondCon1.M;
      Exist1 = ThBondCon1.Exist;
      T2 = ThBondCon2.T;
      p2 = ThBondCon2.p;
      g2 = ThBondCon2.g;
      Sdot2 = -ThBondCon2.d*ThBondCon2.Sdot;
      q2 = -ThBondCon2.d*ThBondCon2.q;
      Mdot2 = -ThBondCon2.d*ThBondCon2.Mdot;
      S2 = ThBondCon2.S;
      V2 = ThBondCon2.V;
      M2 = ThBondCon2.M;
      Exist2 = ThBondCon2.Exist;
    end TwoPort;

    model TwoPortZero "Partial model invoking two thermo-bond graph connectors"
      Modelica.SIunits.Temperature T1 "Temperature";
      Modelica.SIunits.Pressure p1 "Pressure";
      Modelica.SIunits.SpecificEnthalpy g1 "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot1 "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q1 "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot1 "Mass flow";
      Modelica.SIunits.Entropy S1 "Entropy";
      Modelica.SIunits.Volume V1 "Volume";
      Modelica.SIunits.Mass M1 "Mass";
      Boolean Exist1 "True if substance exists";
      Modelica.SIunits.Temperature T2 "Temperature";
      Modelica.SIunits.Pressure p2 "Pressure";
      Modelica.SIunits.SpecificEnthalpy g2 "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot2 "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q2 "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot2 "Mass flow";
      Modelica.SIunits.Entropy S2 "Entropy";
      Modelica.SIunits.Volume V2 "Volume";
      Modelica.SIunits.Mass M2 "Mass";
      Boolean Exist2 "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking two thermo-bond graph connectors.  It is used only for the description of the TwoPort 0-junction.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
    equation
      T1 = ThBondCon1.T;
      p1 = ThBondCon1.p;
      g1 = ThBondCon1.g;
      Sdot1 = ThBondCon1.d*ThBondCon1.Sdot;
      q1 = ThBondCon1.d*ThBondCon1.q;
      Mdot1 = ThBondCon1.d*ThBondCon1.Mdot;
      S1 = ThBondCon1.S;
      V1 = ThBondCon1.V;
      M1 = ThBondCon1.M;
      Exist1 = ThBondCon1.Exist;
      T2 = ThBondCon2.T;
      p2 = ThBondCon2.p;
      g2 = ThBondCon2.g;
      Sdot2 = ThBondCon2.d*ThBondCon2.Sdot;
      q2 = ThBondCon2.d*ThBondCon2.q;
      Mdot2 = ThBondCon2.d*ThBondCon2.Mdot;
      S2 = ThBondCon2.S;
      V2 = ThBondCon2.V;
      M2 = ThBondCon2.M;
      Exist2 = ThBondCon2.Exist;
    end TwoPortZero;

    model ModTwoPort
      "Partial model invoking two thermo-bond graph connectors and one signal connector"
      Modelica.SIunits.Temperature T1 "Temperature";
      Modelica.SIunits.Pressure p1 "Pressure";
      Modelica.SIunits.SpecificEnthalpy g1 "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot1 "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q1 "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot1 "Mass flow";
      Modelica.SIunits.Entropy S1 "Entropy";
      Modelica.SIunits.Volume V1 "Volume";
      Modelica.SIunits.Mass M1 "Mass";
      Boolean Exist1 "True if substance exists";
      Modelica.SIunits.Temperature T2 "Temperature";
      Modelica.SIunits.Pressure p2 "Pressure";
      Modelica.SIunits.SpecificEnthalpy g2 "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot2 "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q2 "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot2 "Mass flow";
      Modelica.SIunits.Entropy S2 "Entropy";
      Modelica.SIunits.Volume V2 "Volume";
      Modelica.SIunits.Mass M2 "Mass";
      Boolean Exist2 "True if substance exists";
      Real s "Signal input";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking two thermo-bond graph connectors and a signal connector.  It is used to describe modulated TwoPort elements.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
      Modelica.Blocks.Interfaces.RealInput InPort1 "Modulating input signal"
                                                annotation (extent=[10, -100;
            -10, -80], rotation=90);
    equation
      T1 = ThBondCon1.T;
      p1 = ThBondCon1.p;
      g1 = ThBondCon1.g;
      Sdot1 = ThBondCon1.d*ThBondCon1.Sdot;
      q1 = ThBondCon1.d*ThBondCon1.q;
      Mdot1 = ThBondCon1.d*ThBondCon1.Mdot;
      S1 = ThBondCon1.S;
      V1 = ThBondCon1.V;
      M1 = ThBondCon1.M;
      Exist1 = ThBondCon1.Exist;
      T2 = ThBondCon2.T;
      p2 = ThBondCon2.p;
      g2 = ThBondCon2.g;
      Sdot2 = -ThBondCon2.d*ThBondCon2.Sdot;
      q2 = -ThBondCon2.d*ThBondCon2.q;
      Mdot2 = -ThBondCon2.d*ThBondCon2.Mdot;
      S2 = ThBondCon2.S;
      V2 = ThBondCon2.V;
      M2 = ThBondCon2.M;
      Exist2 = ThBondCon2.Exist;
      s =InPort1;
    end ModTwoPort;

    model ThreePortZero
      "Partial model invoking three thermo-bond graph connectors"
      Modelica.SIunits.Temperature T[3] "Temperature";
      Modelica.SIunits.Pressure p[3] "Pressure";
      Modelica.SIunits.SpecificEnthalpy g[3] "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot[3] "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q[3] "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot[3] "Mass flow";
      Modelica.SIunits.Entropy S[3] "Entropy";
      Modelica.SIunits.Volume V[3] "Volume";
      Modelica.SIunits.Mass M[3] "Mass";
      Boolean Exist[3] "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking three thermo-bond graph connectors.  It is used only for the description of the ThreePort 0-junction.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
      ThBondCon ThBondCon3 "Third thermo-bond graph connector"
                           annotation (extent=[-10, -110; 10, -90]);
    equation
      T[1] = ThBondCon1.T;
      p[1] = ThBondCon1.p;
      g[1] = ThBondCon1.g;
      Sdot[1] = ThBondCon1.d*ThBondCon1.Sdot;
      q[1] = ThBondCon1.d*ThBondCon1.q;
      Mdot[1] = ThBondCon1.d*ThBondCon1.Mdot;
      S[1] = ThBondCon1.S;
      V[1] = ThBondCon1.V;
      M[1] = ThBondCon1.M;
      Exist[1] = ThBondCon1.Exist;
      T[2] = ThBondCon2.T;
      p[2] = ThBondCon2.p;
      g[2] = ThBondCon2.g;
      Sdot[2] = ThBondCon2.d*ThBondCon2.Sdot;
      q[2] = ThBondCon2.d*ThBondCon2.q;
      Mdot[2] = ThBondCon2.d*ThBondCon2.Mdot;
      S[2] = ThBondCon2.S;
      V[2] = ThBondCon2.V;
      M[2] = ThBondCon2.M;
      Exist[2] = ThBondCon2.Exist;
      T[3] = ThBondCon3.T;
      p[3] = ThBondCon3.p;
      g[3] = ThBondCon3.g;
      Sdot[3] = ThBondCon3.d*ThBondCon3.Sdot;
      q[3] = ThBondCon3.d*ThBondCon3.q;
      Mdot[3] = ThBondCon3.d*ThBondCon3.Mdot;
      S[3] = ThBondCon3.S;
      V[3] = ThBondCon3.V;
      M[3] = ThBondCon3.M;
      Exist[3] = ThBondCon3.Exist;
    end ThreePortZero;

    model FourPortZero
      "Partial model invoking four thermo-bond graph connectors"
      Modelica.SIunits.Temperature T[4] "Temperature";
      Modelica.SIunits.Pressure p[4] "Pressure";
      Modelica.SIunits.SpecificEnthalpy g[4] "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot[4] "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q[4] "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot[4] "Mass flow";
      Modelica.SIunits.Entropy S[4] "Entropy";
      Modelica.SIunits.Volume V[4] "Volume";
      Modelica.SIunits.Mass M[4] "Mass";
      Boolean Exist[4] "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking four thermo-bond graph connectors.  It is used only for the description of the FourPort 0-junction.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
      ThBondCon ThBondCon3 "Third thermo-bond graph connector"
                           annotation (extent=[-10, -110; 10, -90]);
      ThBondCon ThBondCon4 "Fourth thermo-bond graph connector"
                           annotation (extent=[-10, 90; 10, 110]);
    equation
      T[1] = ThBondCon1.T;
      p[1] = ThBondCon1.p;
      g[1] = ThBondCon1.g;
      Sdot[1] = ThBondCon1.d*ThBondCon1.Sdot;
      q[1] = ThBondCon1.d*ThBondCon1.q;
      Mdot[1] = ThBondCon1.d*ThBondCon1.Mdot;
      S[1] = ThBondCon1.S;
      V[1] = ThBondCon1.V;
      M[1] = ThBondCon1.M;
      Exist[1] = ThBondCon1.Exist;
      T[2] = ThBondCon2.T;
      p[2] = ThBondCon2.p;
      g[2] = ThBondCon2.g;
      Sdot[2] = ThBondCon2.d*ThBondCon2.Sdot;
      q[2] = ThBondCon2.d*ThBondCon2.q;
      Mdot[2] = ThBondCon2.d*ThBondCon2.Mdot;
      S[2] = ThBondCon2.S;
      V[2] = ThBondCon2.V;
      M[2] = ThBondCon2.M;
      Exist[2] = ThBondCon2.Exist;
      T[3] = ThBondCon3.T;
      p[3] = ThBondCon3.p;
      g[3] = ThBondCon3.g;
      Sdot[3] = ThBondCon3.d*ThBondCon3.Sdot;
      q[3] = ThBondCon3.d*ThBondCon3.q;
      Mdot[3] = ThBondCon3.d*ThBondCon3.Mdot;
      S[3] = ThBondCon3.S;
      V[3] = ThBondCon3.V;
      M[3] = ThBondCon3.M;
      Exist[3] = ThBondCon3.Exist;
      T[4] = ThBondCon4.T;
      p[4] = ThBondCon4.p;
      g[4] = ThBondCon4.g;
      Sdot[4] = ThBondCon4.d*ThBondCon4.Sdot;
      q[4] = ThBondCon4.d*ThBondCon4.q;
      Mdot[4] = ThBondCon4.d*ThBondCon4.Mdot;
      S[4] = ThBondCon4.S;
      V[4] = ThBondCon4.V;
      M[4] = ThBondCon4.M;
      Exist[4] = ThBondCon4.Exist;
    end FourPortZero;

    model FourPortZero2
      "Partial model invoking up to four thermo-bond graph connectors"
      Modelica.SIunits.Temperature T[4] "Temperature";
      Modelica.SIunits.Pressure p[4] "Pressure";
      Modelica.SIunits.SpecificEnthalpy g[4] "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot[4] "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q[4] "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot[4] "Mass flow";
      Modelica.SIunits.Entropy S[4] "Entropy";
      Modelica.SIunits.Volume V[4] "Volume";
      Modelica.SIunits.Mass M[4] "Mass";
      Boolean Exist[4] "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking four thermo-bond graph connectors.  It is used for the description of a 0-junction with up to four bonds connecting to it.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
      ThBondCon ThBondCon3 "Third thermo-bond graph connector"
                           annotation (extent=[-10, -110; 10, -90]);
      ThBondCon ThBondCon4 "Fourth thermo-bond graph connector"
                           annotation (extent=[-10, 90; 10, 110]);
    equation
      T[1] = ThBondCon1.T;
      p[1] = ThBondCon1.p;
      g[1] = ThBondCon1.g;
      Sdot[1] = ThBondCon1.d*ThBondCon1.Sdot;
      q[1] = ThBondCon1.d*ThBondCon1.q;
      Mdot[1] = ThBondCon1.d*ThBondCon1.Mdot;
      S[1] = ThBondCon1.S;
      V[1] = ThBondCon1.V;
      M[1] = ThBondCon1.M;
      Exist[1] = ThBondCon1.Exist;
      T[2] = ThBondCon2.T;
      p[2] = ThBondCon2.p;
      g[2] = ThBondCon2.g;
      Sdot[2] = ThBondCon2.d*ThBondCon2.Sdot;
      q[2] = ThBondCon2.d*ThBondCon2.q;
      Mdot[2] = ThBondCon2.d*ThBondCon2.Mdot;
      S[2] = ThBondCon2.S;
      V[2] = ThBondCon2.V;
      M[2] = ThBondCon2.M;
      Exist[2] = ThBondCon2.Exist;
      T[3] = ThBondCon3.T;
      p[3] = ThBondCon3.p;
      g[3] = ThBondCon3.g;
      Sdot[3] = ThBondCon3.d*ThBondCon3.Sdot;
      q[3] = ThBondCon3.d*ThBondCon3.q;
      Mdot[3] = ThBondCon3.d*ThBondCon3.Mdot;
      S[3] = ThBondCon3.S;
      V[3] = ThBondCon3.V;
      M[3] = ThBondCon3.M;
      Exist[3] = ThBondCon3.Exist;
      T[4] = ThBondCon4.T;
      p[4] = ThBondCon4.p;
      g[4] = ThBondCon4.g;
      Sdot[4] = ThBondCon4.d*ThBondCon4.Sdot;
      q[4] = ThBondCon4.d*ThBondCon4.q;
      Mdot[4] = ThBondCon4.d*ThBondCon4.Mdot;
      S[4] = ThBondCon4.S;
      V[4] = ThBondCon4.V;
      M[4] = ThBondCon4.M;
      Exist[4] = ThBondCon4.Exist;

      if cardinality(ThBondCon1) == 0 then
        ThBondCon1.d = 1;
        Sdot[1] = 0;
        q[1] = 0;
        Mdot[1] = 0;
      end if;
      if cardinality(ThBondCon2) == 0 then
        ThBondCon2.d = 1;
        Sdot[2] = 0;
        q[2] = 0;
        Mdot[2] = 0;
      end if;
      if cardinality(ThBondCon3) == 0 then
        ThBondCon3.d = 1;
        Sdot[3] = 0;
        q[3] = 0;
        Mdot[3] = 0;
      end if;
      if cardinality(ThBondCon4) == 0 then
        ThBondCon4.d = 1;
        Sdot[4] = 0;
        q[4] = 0;
        Mdot[4] = 0;
      end if;
    end FourPortZero2;

    model FivePortZero
      "Partial model invoking five thermo-bond graph connectors"
      Modelica.SIunits.Temperature T[5] "Temperature";
      Modelica.SIunits.Pressure p[5] "Pressure";
      Modelica.SIunits.SpecificEnthalpy g[5] "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot[5] "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q[5] "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot[5] "Mass flow";
      Modelica.SIunits.Entropy S[5] "Entropy";
      Modelica.SIunits.Volume V[5] "Volume";
      Modelica.SIunits.Mass M[5] "Mass";
      Boolean Exist[5] "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking five thermo-bond graph connectors.  It is used only for the description of the FivePort 0-junction.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
      ThBondCon ThBondCon3 "Third thermo-bond graph connector"
                           annotation (extent=[-50, -110; -30, -90]);
      ThBondCon ThBondCon4 "Fourth thermo-bond graph connector"
                           annotation (extent=[-10, 90; 10, 110]);
      ThBondCon ThBondCon5 "Fifth thermo-bond graph connector"
                           annotation (extent=[30, -110; 50, -90]);
    equation
      T[1] = ThBondCon1.T;
      p[1] = ThBondCon1.p;
      g[1] = ThBondCon1.g;
      Sdot[1] = ThBondCon1.d*ThBondCon1.Sdot;
      q[1] = ThBondCon1.d*ThBondCon1.q;
      Mdot[1] = ThBondCon1.d*ThBondCon1.Mdot;
      S[1] = ThBondCon1.S;
      V[1] = ThBondCon1.V;
      M[1] = ThBondCon1.M;
      Exist[1] = ThBondCon1.Exist;
      T[2] = ThBondCon2.T;
      p[2] = ThBondCon2.p;
      g[2] = ThBondCon2.g;
      Sdot[2] = ThBondCon2.d*ThBondCon2.Sdot;
      q[2] = ThBondCon2.d*ThBondCon2.q;
      Mdot[2] = ThBondCon2.d*ThBondCon2.Mdot;
      S[2] = ThBondCon2.S;
      V[2] = ThBondCon2.V;
      M[2] = ThBondCon2.M;
      Exist[2] = ThBondCon2.Exist;
      T[3] = ThBondCon3.T;
      p[3] = ThBondCon3.p;
      g[3] = ThBondCon3.g;
      Sdot[3] = ThBondCon3.d*ThBondCon3.Sdot;
      q[3] = ThBondCon3.d*ThBondCon3.q;
      Mdot[3] = ThBondCon3.d*ThBondCon3.Mdot;
      S[3] = ThBondCon3.S;
      V[3] = ThBondCon3.V;
      M[3] = ThBondCon3.M;
      Exist[3] = ThBondCon3.Exist;
      T[4] = ThBondCon4.T;
      p[4] = ThBondCon4.p;
      g[4] = ThBondCon4.g;
      Sdot[4] = ThBondCon4.d*ThBondCon4.Sdot;
      q[4] = ThBondCon4.d*ThBondCon4.q;
      Mdot[4] = ThBondCon4.d*ThBondCon4.Mdot;
      S[4] = ThBondCon4.S;
      V[4] = ThBondCon4.V;
      M[4] = ThBondCon4.M;
      Exist[4] = ThBondCon4.Exist;
      T[5] = ThBondCon5.T;
      p[5] = ThBondCon5.p;
      g[5] = ThBondCon5.g;
      Sdot[5] = ThBondCon5.d*ThBondCon5.Sdot;
      q[5] = ThBondCon5.d*ThBondCon5.q;
      Mdot[5] = ThBondCon5.d*ThBondCon5.Mdot;
      S[5] = ThBondCon5.S;
      V[5] = ThBondCon5.V;
      M[5] = ThBondCon5.M;
      Exist[5] = ThBondCon5.Exist;
    end FivePortZero;

    model SixPortZero "Partial model invoking six thermo-bond graph connectors"
      Modelica.SIunits.Temperature T[6] "Temperature";
      Modelica.SIunits.Pressure p[6] "Pressure";
      Modelica.SIunits.SpecificEnthalpy g[6] "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot[6] "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q[6] "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot[6] "Mass flow";
      Modelica.SIunits.Entropy S[6] "Entropy";
      Modelica.SIunits.Volume V[6] "Volume";
      Modelica.SIunits.Mass M[6] "Mass";
      Boolean Exist[6] "True if substance exists";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is a partial model invoking six thermo-bond graph connectors.  It is used only for the description of the SixPort 0-junction.
</html>"),
        Diagram);
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-110, -10; -90, 10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[90, -10; 110, 10]);
      ThBondCon ThBondCon3 "Third thermo-bond graph connector"
                           annotation (extent=[-50, -110; -30, -90]);
      ThBondCon ThBondCon4 "Fourth thermo-bond graph connector"
                           annotation (extent=[-50, 90; -30, 110]);
      ThBondCon ThBondCon5 "Fifth thermo-bond graph connector"
                           annotation (extent=[30, -110; 50, -90]);
      ThBondCon ThBondCon6 "Sixth thermo-bond graph connector"
                           annotation (extent=[30, 90; 50, 110]);
    equation
      T[1] = ThBondCon1.T;
      p[1] = ThBondCon1.p;
      g[1] = ThBondCon1.g;
      Sdot[1] = ThBondCon1.d*ThBondCon1.Sdot;
      q[1] = ThBondCon1.d*ThBondCon1.q;
      Mdot[1] = ThBondCon1.d*ThBondCon1.Mdot;
      S[1] = ThBondCon1.S;
      V[1] = ThBondCon1.V;
      M[1] = ThBondCon1.M;
      Exist[1] = ThBondCon1.Exist;
      T[2] = ThBondCon2.T;
      p[2] = ThBondCon2.p;
      g[2] = ThBondCon2.g;
      Sdot[2] = ThBondCon2.d*ThBondCon2.Sdot;
      q[2] = ThBondCon2.d*ThBondCon2.q;
      Mdot[2] = ThBondCon2.d*ThBondCon2.Mdot;
      S[2] = ThBondCon2.S;
      V[2] = ThBondCon2.V;
      M[2] = ThBondCon2.M;
      Exist[2] = ThBondCon2.Exist;
      T[3] = ThBondCon3.T;
      p[3] = ThBondCon3.p;
      g[3] = ThBondCon3.g;
      Sdot[3] = ThBondCon3.d*ThBondCon3.Sdot;
      q[3] = ThBondCon3.d*ThBondCon3.q;
      Mdot[3] = ThBondCon3.d*ThBondCon3.Mdot;
      S[3] = ThBondCon3.S;
      V[3] = ThBondCon3.V;
      M[3] = ThBondCon3.M;
      Exist[3] = ThBondCon3.Exist;
      T[4] = ThBondCon4.T;
      p[4] = ThBondCon4.p;
      g[4] = ThBondCon4.g;
      Sdot[4] = ThBondCon4.d*ThBondCon4.Sdot;
      q[4] = ThBondCon4.d*ThBondCon4.q;
      Mdot[4] = ThBondCon4.d*ThBondCon4.Mdot;
      S[4] = ThBondCon4.S;
      V[4] = ThBondCon4.V;
      M[4] = ThBondCon4.M;
      Exist[4] = ThBondCon4.Exist;
      T[5] = ThBondCon5.T;
      p[5] = ThBondCon5.p;
      g[5] = ThBondCon5.g;
      Sdot[5] = ThBondCon5.d*ThBondCon5.Sdot;
      q[5] = ThBondCon5.d*ThBondCon5.q;
      Mdot[5] = ThBondCon5.d*ThBondCon5.Mdot;
      S[5] = ThBondCon5.S;
      V[5] = ThBondCon5.V;
      M[5] = ThBondCon5.M;
      Exist[5] = ThBondCon5.Exist;
      T[6] = ThBondCon6.T;
      p[6] = ThBondCon6.p;
      g[6] = ThBondCon6.g;
      Sdot[6] = ThBondCon6.d*ThBondCon6.Sdot;
      q[6] = ThBondCon6.d*ThBondCon6.q;
      Mdot[6] = ThBondCon6.d*ThBondCon6.Mdot;
      S[6] = ThBondCon6.S;
      V[6] = ThBondCon6.V;
      M[6] = ThBondCon6.M;
      Exist[6] = ThBondCon6.Exist;
    end SixPortZero;

    model EightPortZero
      "Partial model invoking up to eight thermo-bond graph connectors"
      Modelica.SIunits.Temperature T[8] "Temperature";
      Modelica.SIunits.Pressure p[8] "Pressure";
      Modelica.SIunits.SpecificEnthalpy g[8] "Gibbs potential";
      Modelica.SIunits.ThermalConductance Sdot[8] "Entropy flow";
      Modelica.SIunits.VolumeFlowRate q[8] "Volume flow";
      Modelica.SIunits.MassFlowRate Mdot[8] "Mass flow";
      Modelica.SIunits.Entropy S[8] "Entropy";
      Modelica.SIunits.Volume V[8] "Volume";
      Modelica.SIunits.Mass M[8] "Mass";
      Boolean Exist[8] "True if substance exists";
      annotation (Coordsys(
          extent=[-200,-200; 200,200],
          grid=[2, 2],
          component=[20, 20],
          scale=0.1),          Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Icon,
        Diagram,
        Documentation(info="<html>
This is a partial model invoking eight thermo-bond graph connectors.  It is used for the description of a 0-junction with up to eight bonds connecting to it.
</html>"));
      ThBondCon ThBondCon1 "First thermo-bond graph connector"
                           annotation (extent=[-210,-10; -190,10]);
      ThBondCon ThBondCon2 "Second thermo-bond graph connector"
                           annotation (extent=[-110,90; -90,110]);
      ThBondCon ThBondCon3 "Third thermo-bond graph connector"
                           annotation (extent=[-10,190; 10,210]);
      ThBondCon ThBondCon4 "Fourth thermo-bond graph connector"
                           annotation (extent=[90,90; 110,110]);
      ThBondCon ThBondCon5 "Fifth thermo-bond graph connector"
                           annotation (extent=[190,-10; 210,10]);
      ThBondCon ThBondCon6 "Sixth thermo-bond graph connector"
                           annotation (extent=[90,-110; 110,-90]);
      ThBondCon ThBondCon7 "Seventh thermo-bond graph connector"
                           annotation (extent=[-10,-210; 10,-190]);
      ThBondCon ThBondCon8 "Eighth thermo-bond graph connector"
                           annotation (extent=[-110,-110; -90,-90]);
    equation
      T[1] = ThBondCon1.T;
      p[1] = ThBondCon1.p;
      g[1] = ThBondCon1.g;
      Sdot[1] = ThBondCon1.d*ThBondCon1.Sdot;
      q[1] = ThBondCon1.d*ThBondCon1.q;
      Mdot[1] = ThBondCon1.d*ThBondCon1.Mdot;
      S[1] = ThBondCon1.S;
      V[1] = ThBondCon1.V;
      M[1] = ThBondCon1.M;
      Exist[1] = ThBondCon1.Exist;
      T[2] = ThBondCon2.T;
      p[2] = ThBondCon2.p;
      g[2] = ThBondCon2.g;
      Sdot[2] = ThBondCon2.d*ThBondCon2.Sdot;
      q[2] = ThBondCon2.d*ThBondCon2.q;
      Mdot[2] = ThBondCon2.d*ThBondCon2.Mdot;
      S[2] = ThBondCon2.S;
      V[2] = ThBondCon2.V;
      M[2] = ThBondCon2.M;
      Exist[2] = ThBondCon2.Exist;
      T[3] = ThBondCon3.T;
      p[3] = ThBondCon3.p;
      g[3] = ThBondCon3.g;
      Sdot[3] = ThBondCon3.d*ThBondCon3.Sdot;
      q[3] = ThBondCon3.d*ThBondCon3.q;
      Mdot[3] = ThBondCon3.d*ThBondCon3.Mdot;
      S[3] = ThBondCon3.S;
      V[3] = ThBondCon3.V;
      M[3] = ThBondCon3.M;
      Exist[3] = ThBondCon3.Exist;
      T[4] = ThBondCon4.T;
      p[4] = ThBondCon4.p;
      g[4] = ThBondCon4.g;
      Sdot[4] = ThBondCon4.d*ThBondCon4.Sdot;
      q[4] = ThBondCon4.d*ThBondCon4.q;
      Mdot[4] = ThBondCon4.d*ThBondCon4.Mdot;
      S[4] = ThBondCon4.S;
      V[4] = ThBondCon4.V;
      M[4] = ThBondCon4.M;
      Exist[4] = ThBondCon4.Exist;
      T[5] = ThBondCon5.T;
      p[5] = ThBondCon5.p;
      g[5] = ThBondCon5.g;
      Sdot[5] = ThBondCon5.d*ThBondCon5.Sdot;
      q[5] = ThBondCon5.d*ThBondCon5.q;
      Mdot[5] = ThBondCon5.d*ThBondCon5.Mdot;
      S[5] = ThBondCon5.S;
      V[5] = ThBondCon5.V;
      M[5] = ThBondCon5.M;
      Exist[5] = ThBondCon5.Exist;
      T[6] = ThBondCon6.T;
      p[6] = ThBondCon6.p;
      g[6] = ThBondCon6.g;
      Sdot[6] = ThBondCon6.d*ThBondCon6.Sdot;
      q[6] = ThBondCon6.d*ThBondCon6.q;
      Mdot[6] = ThBondCon6.d*ThBondCon6.Mdot;
      S[6] = ThBondCon6.S;
      V[6] = ThBondCon6.V;
      M[6] = ThBondCon6.M;
      Exist[6] = ThBondCon6.Exist;
      T[7] = ThBondCon7.T;
      p[7] = ThBondCon7.p;
      g[7] = ThBondCon7.g;
      Sdot[7] = ThBondCon7.d*ThBondCon7.Sdot;
      q[7] = ThBondCon7.d*ThBondCon7.q;
      Mdot[7] = ThBondCon7.d*ThBondCon7.Mdot;
      S[7] = ThBondCon7.S;
      V[7] = ThBondCon7.V;
      M[7] = ThBondCon7.M;
      Exist[7] = ThBondCon7.Exist;
      T[8] = ThBondCon8.T;
      p[8] = ThBondCon8.p;
      g[8] = ThBondCon8.g;
      Sdot[8] = ThBondCon8.d*ThBondCon8.Sdot;
      q[8] = ThBondCon8.d*ThBondCon8.q;
      Mdot[8] = ThBondCon8.d*ThBondCon8.Mdot;
      S[8] = ThBondCon8.S;
      V[8] = ThBondCon8.V;
      M[8] = ThBondCon8.M;
      Exist[8] = ThBondCon8.Exist;

      if cardinality(ThBondCon1) == 0 then
        ThBondCon1.d = 1;
        Sdot[1] = 0;
        q[1] = 0;
        Mdot[1] = 0;
      end if;
      if cardinality(ThBondCon2) == 0 then
        ThBondCon2.d = 1;
        Sdot[2] = 0;
        q[2] = 0;
        Mdot[2] = 0;
      end if;
      if cardinality(ThBondCon3) == 0 then
        ThBondCon3.d = 1;
        Sdot[3] = 0;
        q[3] = 0;
        Mdot[3] = 0;
      end if;
      if cardinality(ThBondCon4) == 0 then
        ThBondCon4.d = 1;
        Sdot[4] = 0;
        q[4] = 0;
        Mdot[4] = 0;
      end if;
      if cardinality(ThBondCon5) == 0 then
        ThBondCon5.d = 1;
        Sdot[5] = 0;
        q[5] = 0;
        Mdot[5] = 0;
      end if;
      if cardinality(ThBondCon6) == 0 then
        ThBondCon6.d = 1;
        Sdot[6] = 0;
        q[6] = 0;
        Mdot[6] = 0;
      end if;
      if cardinality(ThBondCon7) == 0 then
        ThBondCon7.d = 1;
        Sdot[7] = 0;
        q[7] = 0;
        Mdot[7] = 0;
      end if;
      if cardinality(ThBondCon8) == 0 then
        ThBondCon8.d = 1;
        Sdot[8] = 0;
        q[8] = 0;
        Mdot[8] = 0;
      end if;
    end EightPortZero;
  end Interfaces;

  package Bonds "Bonds of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 122; 120, 73],
          string="%name",
          style(color=1))),
      Window(
        x=0,
        y=0.6,
        width=0.4,
        height=0.4,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains models of the three bonds of the Modelica thermo-bond graph library.  The <b>ThermoBond</b> model describes the a-causal bonds, whereas the <b>eThermoBond</b> and <b>fThermoBond</b> blocks describe the two causal bonds. <p>

Although it is possible to work with a-causal bonds throughout, it is recommended to use causal bonds whenever possible. <p>

Bonds must be connected to either elements or junctions.  It is illegal to connect two bonds in series.
</html>"));
    model ThermoBond "The a-causal bond model of the thermo-bond graph library"

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Line(points=[-80, 0; 80, 0], style(color=41, thickness=2)),
          Line(points=[80, 0; 40, 40], style(color=41, thickness=2)),
          Text(
            extent=[-58, -26; 42, -58],
            string="Sdot,q,Mdot",
            style(color=0)),
          Text(
            extent=[-40, 60; 18, 30],
            string="T,p,g",
            style(color=0)),
          Line(points=[-20, 18; 20, -18], style(color=41)),
          Text(
            extent=[-6, 24; 12, 6],
            string="3",
            style(color=41))),
        Icon(
          Line(points=[-80, 0; 80, 0], style(color=41, thickness=2)),
          Line(points=[80, 0; 40, 40], style(color=41, thickness=2)),
          Text(
            extent=[-70, -22; 72, -60],
            string="%name",
            style(color=0, pattern=0)),
          Line(points=[-20, 18; 20, -18], style(color=41)),
          Text(
            extent=[-6, 24; 12, 6],
            string="3",
            style(color=41))),
        Window(
          x=0.37,
          y=0.01,
          width=0.47,
          height=0.52),
        Documentation(info="<html>
This is the model of the general a-causal thermo-bond of the Modelica thermo-bond graph library. <p>

The model invokes two general thermo-bond connectors.  It does so directly, i.e., without inheriting them from the TwoPort partial model. <p>

The Model passes the effort and flow variables from the inflow to the outflow, and it sets the directional variable <b>d</b> to <b>-1</b> at the inflow, and to <b>+1</b> at the outflow.
</html>"));
      Interfaces.ThBondCon ThBondCon1 "Left thermo-bond graph connector"
                                      annotation (extent=[-110, -10; -90, 10]);
      Interfaces.ThBondCon ThBondCon2 "Right thermo-bond graph connector"
                                      annotation (extent=[90, -10; 110, 10]);
    equation
      ThBondCon2.T = ThBondCon1.T;
      ThBondCon2.p = ThBondCon1.p;
      ThBondCon2.g = ThBondCon1.g;
      ThBondCon2.Sdot = ThBondCon1.Sdot;
      ThBondCon2.q = ThBondCon1.q;
      ThBondCon2.Mdot = ThBondCon1.Mdot;
      ThBondCon2.S = ThBondCon1.S;
      ThBondCon2.V = ThBondCon1.V;
      ThBondCon2.M = ThBondCon1.M;
      ThBondCon2.Exist = ThBondCon1.Exist;
      ThBondCon1.d = -1;
      ThBondCon2.d = +1;
    end ThermoBond;

    block eThermoBond
      "One of two causal bond models of the thermo-bond graph library"

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Line(points=[-80, 0; 80, 0], style(color=41, thickness=2)),
          Line(points=[80, 0; 40, 40], style(color=41, thickness=2)),
          Text(
            extent=[-58, -26; 48, -58],
            string="Sdot,q,Mdot",
            style(color=0)),
          Text(
            extent=[-40, 60; 18, 30],
            string="T,p,g",
            style(color=0)),
          Line(points=[-20, 18; 20, -18], style(color=41)),
          Text(
            extent=[-6, 24; 12, 6],
            string="3",
            style(color=41)),
          Line(points=[-80, 40; -80, -40], style(color=41, thickness=2)),
          Line(points=[-40, 46; -72, 46], style(
              color=0,
              thickness=2,
              arrow=1)),
          Line(points=[50, -42; 80, -42], style(
              color=0,
              thickness=2,
              arrow=1))),
        Icon(
          Line(points=[-80, 0; 80, 0], style(color=41, thickness=2)),
          Line(points=[80, 0; 40, 40], style(color=41, thickness=2)),
          Text(
            extent=[-70, -22; 72, -60],
            string="%name",
            style(color=0, pattern=0)),
          Line(points=[-20, 18; 20, -18], style(color=41)),
          Text(
            extent=[-6, 24; 12, 6],
            string="3",
            style(color=41)),
          Line(points=[-80, 40; -80, -40], style(color=41, thickness=2))),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
This is the model of one of two causal thermo-bonds of the Modelica thermo-bond graph library. <p>

The model invokes one <b>fThBond</b> and one <b>eThBond</b> connector.  The <b>fThBond</b> connector is used at the inflow, i.e., where the flow variable is being computed, whereas the <b>eThBond</b> connector is used at the outflow, i.e., where the effort variable is being computed. Thus, the causality stroke of this causal thermo-bond is at the inflow. <p>

The model passes the effort and flow variables from the inflow to the outflow, and it sets the directional variable <b>d</b> to <b>-1</b> at the inflow, and to <b>+1</b> at the outflow.
</html>"));
      Interfaces.fThBondCon fThBondCon1 "Left thermo-bond graph connector"
                                        annotation (extent=[-110, -10; -90, 10]);
      Interfaces.eThBondCon eThBondCon1 "Right thermo-bond graph connector"
                                        annotation (extent=[90, -10; 110, 10]);
    equation
      fThBondCon1.T = eThBondCon1.T;
      fThBondCon1.p = eThBondCon1.p;
      fThBondCon1.g = eThBondCon1.g;
      eThBondCon1.Sdot = fThBondCon1.Sdot;
      eThBondCon1.q = fThBondCon1.q;
      eThBondCon1.Mdot = fThBondCon1.Mdot;
      fThBondCon1.S = eThBondCon1.S;
      fThBondCon1.V = eThBondCon1.V;
      fThBondCon1.M = eThBondCon1.M;
      fThBondCon1.Exist = eThBondCon1.Exist;
      fThBondCon1.d = -1;
      eThBondCon1.d = +1;
    end eThermoBond;

    block fThermoBond
      "One of two causal bond models of the thermo-bond graph library"

      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Line(points=[-80, 0; 80, 0], style(color=41, thickness=2)),
          Line(points=[80, 0; 40, 40], style(color=41, thickness=2)),
          Text(
            extent=[-34, -26; 72, -58],
            string="Sdot,q,Mdot",
            style(color=0)),
          Text(
            extent=[-60, 60; -2, 30],
            string="T,p,g",
            style(color=0)),
          Line(points=[-20, 18; 20, -18], style(color=41)),
          Text(
            extent=[-6, 24; 12, 6],
            string="3",
            style(color=41)),
          Line(points=[80, 40; 80, -40], style(color=41, thickness=2)),
          Line(points=[-38, -42; -70, -42], style(
              color=0,
              thickness=2,
              arrow=1)),
          Line(points=[0, 44; 30, 44], style(
              color=0,
              thickness=2,
              arrow=1))),
        Icon(
          Line(points=[-80, 0; 80, 0], style(color=41, thickness=2)),
          Line(points=[80, 0; 40, 40], style(color=41, thickness=2)),
          Text(
            extent=[-70, -22; 72, -60],
            string="%name",
            style(color=0, pattern=0)),
          Line(points=[-20, 18; 20, -18], style(color=41)),
          Text(
            extent=[-6, 24; 12, 6],
            string="3",
            style(color=41)),
          Line(points=[80, 40; 80, -40], style(color=41, thickness=2))),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
This is the model of one of two causal thermo-bonds of the Modelica thermo-bond graph library. <p>

The model invokes one <b>eThBond</b> and one <b>fThBond</b> connector.  The <b>eThBond</b> connector is used at the inflow, i.e., where the effort variable is being computed, whereas the <b>fThBond</b> connector is used at the outflow, i.e., where the flow variable is being computed. Thus, the causality stroke of this causal thermo-bond is at the outflow. <p>

The model passes the effort and flow variables from the inflow to the outflow, and it sets the directional variable <b>d</b> to <b>-1</b> at the inflow, and to <b>+1</b> at the outflow.
</html>"));
      Interfaces.eThBondCon eThBondCon1 "Left thermo-bond graph connector"
                                        annotation (extent=[-110, -10; -90, 10]);
      Interfaces.fThBondCon fThBondCon1 "Right thermo-bond graph connector"
                                        annotation (extent=[90, -10; 110, 10]);
    equation
      fThBondCon1.T = eThBondCon1.T;
      fThBondCon1.p = eThBondCon1.p;
      fThBondCon1.g = eThBondCon1.g;
      eThBondCon1.Sdot = fThBondCon1.Sdot;
      eThBondCon1.q = fThBondCon1.q;
      eThBondCon1.Mdot = fThBondCon1.Mdot;
      fThBondCon1.S = eThBondCon1.S;
      fThBondCon1.V = eThBondCon1.V;
      fThBondCon1.M = eThBondCon1.M;
      fThBondCon1.Exist = eThBondCon1.Exist;
      eThBondCon1.d = -1;
      fThBondCon1.d = +1;
    end fThermoBond;
  end Bonds;

  package Junctions "Junctions of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 122; 120, 73],
          string="%name",
          style(color=1))),
      Window(
        x=0.45,
        y=0.01,
        width=0.44,
        height=0.65,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains models of the different junctions of the Modelica thermo-bond graph library.  The library distinguishes explicitly between junctions with 2, 3, 4, 5, and 6 connectors.  If more than 6 connectors are needed, the junction needs to be split.  The library also offers two junction models with a variable number of connections (up to 4 and up to 8). Using those two model types, unused connections can be left unconnected. <p>

Since neighboring same-sex junctions can always be treated logically like a single junction, it is possible to construct junctions with arbitrarily many connectors.<p>

Junctions must be connected to bonds.  It is illegal to connect junctions to either modeling elements or other junctions directly.  If junctions are being split, a bond must be placed between them. <p>

The thermo-bond graph methodology uses 0-junctions only.  Hence no 1-junction models are being provided.
</html>"));
    model J0p11
      "Model of a converter junction converting a thermo-bond connector to a regular bond connector"
      extends Interfaces.OneOnePort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41)), Text(
            extent=[68, 16; 90, -18],
            string="T",
            style(color=0))),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41)), Text(
            extent=[68, 16; 90, -18],
            string="T",
            style(color=0))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the thermal converter 0-junction.  It extracts the heat flow from the thermo-bond graph connector and places it in an individual regular bond graph connector.
</html>"));
    equation
      e = T;
      Sdot + f = 0;
      q = 0;
      Mdot = 0;
    end J0p11;

    model J0p12
      "Model of a converter junction converting a thermo-bond connector to two regular bond connectors"
      extends Interfaces.OneTwoPort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41)),
          Text(
            extent=[68, 16; 90, -18],
            string="T",
            style(color=0)),
          Text(
            extent=[-10, 96; 12, 62],
            string="p",
            style(color=0))),
        Icon(
          Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41)),
          Text(
            extent=[68, 16; 90, -18],
            string="T",
            style(color=0)),
          Text(
            extent=[-10, 96; 12, 62],
            string="p",
            style(color=0))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the thermal and volume flow converter 0-junction.  It extracts the heat and volume flows from the thermo-bond graph connector and places them in two separate regular bond graph connectors.
</html>"));
    equation
      e1 = T;
      Sdot + f1 = 0;
      e2 = p;
      q + f2 = 0;
      Mdot = 0;

    end J0p12;

    model J0p13
      "Model of a converter junction converting a thermo-bond connector to three regular bond connectors"
      extends Interfaces.OneThreePort;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41)),
          Text(
            extent=[68, 16; 90, -18],
            string="T",
            style(color=0)),
          Text(
            extent=[-10, 96; 12, 62],
            string="p",
            style(color=0)),
          Text(
            extent=[-10, -54; 12, -88],
            string="g",
            style(color=0))),
        Icon(
          Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41)),
          Text(
            extent=[68, 16; 90, -18],
            string="T",
            style(color=0)),
          Text(
            extent=[-10, 96; 12, 62],
            string="p",
            style(color=0)),
          Text(
            extent=[-10, -54; 12, -88],
            string="g",
            style(color=0))),
        Documentation(info="<html>
This is the model of the thermal, volume, and mass flow converter 0-junction.  It extracts the heat, volume, and mass flows from the thermo-bond graph connector and places them in three separate regular bond graph connectors.
</html>"));
    equation
      e1 = T;
      Sdot + f1 = 0;
      e2 = p;
      q + f2 = 0;
      e3 = g;
      Mdot + f3 = 0;
    end J0p13;

    model J0p2 "Model of TwoPort 0-junction"
      extends Interfaces.TwoPortZero;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
This is the model of the TwoPort 0-junction.  It has one causality stroke.
</html>"));
    equation
      T2 = T1;
      p2 = p1;
      g2 = g1;
      Sdot1 + Sdot2 = 0;
      q1 + q2 = 0;
      Mdot1 + Mdot2 = 0;
      S2 = S1;
      V2 = V1;
      M2 = M1;
      Exist2 = Exist1;
    end J0p2;

    model J0p3 "Model of ThreePort 0-junction"
      extends Interfaces.ThreePortZero;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the ThreePort 0-junction.  It has one causality stroke.
</html>"));
    equation
      T[2:3] = T[1:2];
      p[2:3] = p[1:2];
      g[2:3] = g[1:2];
      sum(Sdot) = 0;
      sum(q) = 0;
      sum(Mdot) = 0;
      S[2:3] = S[1:2];
      V[2:3] = V[1:2];
      M[2:3] = M[1:2];
      Exist[2:3] = Exist[1:2];
    end J0p3;

    model J0p4 "Model of FourPort 0-junction"
      extends Interfaces.FourPortZero;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the FourPort 0-junction.  It has one causality stroke.
</html>"));
    equation
      T[2:4] = T[1:3];
      p[2:4] = p[1:3];
      g[2:4] = g[1:3];
      sum(Sdot) = 0;
      sum(q) = 0;
      sum(Mdot) = 0;
      S[2:4] = S[1:3];
      V[2:4] = V[1:3];
      M[2:4] = M[1:3];
      Exist[2:4] = Exist[1:3];
    end J0p4;

    model J0p5 "Model of FivePort 0-junction"
      extends Interfaces.FivePortZero;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the FivePort 0-junction.  It has one causality stroke.
</html>"));
    equation
      T[2:5] = T[1:4];
      p[2:5] = p[1:4];
      g[2:5] = g[1:4];
      sum(Sdot) = 0;
      sum(q) = 0;
      sum(Mdot) = 0;
      S[2:5] = S[1:4];
      V[2:5] = V[1:4];
      M[2:5] = M[1:4];
      Exist[2:5] = Exist[1:4];
    end J0p5;

    model J0p6 "Model of SixPort 0-junction"
      extends Interfaces.SixPortZero;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the SixPort 0-junction.  It has one causality stroke.
</html>"));
    equation
      T[2:6] = T[1:5];
      p[2:6] = p[1:5];
      g[2:6] = g[1:5];
      sum(Sdot) = 0;
      sum(q) = 0;
      sum(Mdot) = 0;
      S[2:6] = S[1:5];
      V[2:6] = V[1:5];
      M[2:6] = M[1:5];
      Exist[2:6] = Exist[1:5];
    end J0p6;

    model J0 "Model of a standard 0-junction with up to four ports"
      extends Interfaces.FourPortZero2;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Icon(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the generalized FourPort 0-junction.  It has one causality stroke. <p>

Contrary to the regular FourPoint 0-junction (<b>J0p4</b>), this model allows connectors to remain unconnected externally.  Hence the junction can be used for up to four bond connections.
</html>"));
    equation
      T[2:4] = T[1:3];
      p[2:4] = p[1:3];
      g[2:4] = g[1:3];
      sum(Sdot) = 0;
      sum(q) = 0;
      sum(Mdot) = 0;
      S[2:4] = S[1:3];
      V[2:4] = V[1:3];
      M[2:4] = M[1:3];
      Exist[2:4] = Exist[1:3];
    end J0;

    model J0large "Model of a standard 0-junction with up to four ports"
      extends Interfaces.EightPortZero;
      annotation (
        Coordsys(
          extent=[-200,-200; 200,200],
          grid=[2, 2],
          component=[20, 20],
          scale=0.1),
        Diagram(Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Icon(
          Line(points=[-102,0; -194,0], style(color=1, rgbcolor={255,0,0})),
          Line(points=[0,100; 0,194], style(color=1, rgbcolor={255,0,0})),
          Line(points=[104,0; 194,0], style(color=1, rgbcolor={255,0,0})),
          Line(points=[0,-104; 0,-194], style(color=1, rgbcolor={255,0,0})),
          Line(points=[-70,70; -96,96], style(color=1, rgbcolor={255,0,0})),
          Line(points=[70,70; 96,96], style(color=1, rgbcolor={255,0,0})),
          Line(points=[70,-70; 96,-96], style(color=1, rgbcolor={255,0,0})),
          Line(points=[-70,-70; -96,-96], style(color=1, rgbcolor={255,0,0})),
          Ellipse(extent=[120,120; -120,-120], style(
              color=1,
              rgbcolor={255,0,0},
              fillColor=7,
              rgbfillColor={255,255,255},
              fillPattern=1)),
             Text(
            extent=[-60, 80; 60, -80],
            string="0",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This is the model of the EightPort 0-junction.  It has one causality stroke. <p>

This model allows connectors to remain unconnected externally.  Hence the junction can be used for up to eight bond connections.
</html>"));
    equation
      T[2:8] = T[1:7];
      p[2:8] = p[1:7];
      g[2:8] = g[1:7];
      sum(Sdot) = 0;
      sum(q) = 0;
      sum(Mdot) = 0;
      S[2:8] = S[1:7];
      V[2:8] = V[1:7];
      M[2:8] = M[1:7];
      Exist[2:8] = Exist[1:7];
    end J0large;
  end Junctions;

  package Passive "Passive elements of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 122; 120, 73],
          string="%name",
          style(color=1))),
      Window(
        x=0.45,
        y=0.01,
        width=0.44,
        height=0.65,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains a set of transport models.  Using some of these models, fluids are transported from one storage to another.  Other models represent the potential equilibration between neighboring storages.
</html>"));
    block MV "Volume flow to mass flow converter"
      extends Modelica.Blocks.Interfaces.SISO(y(redeclare type SignalType =
              Modelica.SIunits.MassFlowRate), u(redeclare type SignalType =
              Modelica.SIunits.VolumeFlowRate));
      parameter Modelica.SIunits.VolumeFlowRate eps_v = Modelica.Constants.small
        "Smallest absolute volume flow considered unequal zero";
      output Modelica.SIunits.Entropy S "Entropy";
      output Modelica.SIunits.Volume V "Volume";
      output Modelica.SIunits.Mass M "Mass";
      output Modelica.SIunits.VolumeFlowRate f1 "Volume inflow";
      output Modelica.SIunits.MassFlowRate f2 "Mass outflow";
      output Boolean Exist;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-34, 34; 34, -36],
            string="M / V",
            style(color=74, rgbcolor={0,0,127})),
          Rectangle(extent=[-40, 40; 40, -40], style(color=74, rgbcolor={0,0,
                  127})),
          Line(points=[-100, 0; -40, 0], style(color=74, rgbcolor={0,0,127})),
          Line(points=[40, 0; 100, 0], style(color=74, rgbcolor={0,0,127})),
          Text(extent=[-2, -54; 28, -66], string="State",
            style(color=74, rgbcolor={0,0,127})),
          Line(points=[0, -80; 0, -40], style(color=74, rgbcolor={0,0,127})),
          Text(extent=[-86, 14; -56, 2], string="Inflow",
            style(color=74, rgbcolor={0,0,127})),
          Text(extent=[54, 14; 86, 2], string="Outflow",
            style(color=74, rgbcolor={0,0,127}))),
        Icon(
          Text(
            extent=[-34, 34; 34, -36],
            string="M / V",
            style(color=73)),
          Rectangle(extent=[-40, 40; 40, -40]),
          Line(points=[-100, 0; -40, 0]),
          Line(points=[40, 0; 100, 0]),
          Text(extent=[-2, -54; 28, -66], string="State"),
          Line(points=[0, -80; 0, -40]),
          Text(extent=[-86, 14; -56, 2], string="Inflow"),
          Text(extent=[54, 14; 86, 2], string="Outflow")),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This block computes the mass flow accompanying a volume flow.
</html>"));
      Modelica.Blocks.Interfaces.RealInput InPort1[3]
        "State information signal input vector"      annotation (extent=[-10,
            -100; 10, -80], rotation=90);
    equation
      S = InPort1[1];
      V = InPort1[2];
      M = InPort1[3];
      Exist = abs(u) > eps_v;
      f1 = u;
      f2 = if Exist then (M/V)*f1 else 0;
      y = f2;
    end MV;

    block SV "Volume flow to entropy flow converter"
      extends Modelica.Blocks.Interfaces.SISO(y(redeclare type SignalType =
              Modelica.SIunits.ThermalConductance), u(redeclare type SignalType
            = Modelica.SIunits.VolumeFlowRate));
      parameter Modelica.SIunits.VolumeFlowRate eps_v = Modelica.Constants.small
        "Smallest absolute volume flow considered unequal zero";
      output Modelica.SIunits.Entropy S "Entropy";
      output Modelica.SIunits.Volume V "Volume";
      output Modelica.SIunits.Mass M "Mass";
      output Modelica.SIunits.VolumeFlowRate f1 "Volume inflow";
      output Modelica.SIunits.ThermalConductance f2 "Entropy outflow";
      output Boolean Exist;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-34, 34; 34, -36],
            string="S / V",
            style(color=74, rgbcolor={0,0,127})),
          Rectangle(extent=[-40, 40; 40, -40], style(color=74, rgbcolor={0,0,
                  127})),
          Line(points=[-100, 0; -40, 0], style(color=74, rgbcolor={0,0,127})),
          Line(points=[40, 0; 100, 0], style(color=74, rgbcolor={0,0,127})),
          Text(extent=[-2, -54; 28, -66], string="State",
            style(color=74, rgbcolor={0,0,127})),
          Line(points=[0, -80; 0, -40], style(color=74, rgbcolor={0,0,127})),
          Text(extent=[-86, 14; -56, 2], string="Inflow",
            style(color=74, rgbcolor={0,0,127})),
          Text(extent=[54, 14; 86, 2], string="Outflow",
            style(color=74, rgbcolor={0,0,127}))),
        Icon(
          Text(
            extent=[-34, 34; 34, -36],
            string="S / V",
            style(color=73)),
          Rectangle(extent=[-40, 40; 40, -40]),
          Line(points=[-100, 0; -40, 0]),
          Line(points=[40, 0; 100, 0]),
          Text(extent=[-2, -54; 28, -66], string="State"),
          Line(points=[0, -80; 0, -40]),
          Text(extent=[-86, 14; -56, 2], string="Inflow"),
          Text(extent=[54, 14; 86, 2], string="Outflow")),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This block computes the entropy flow accompanying a volume flow.
</html>"));
      Modelica.Blocks.Interfaces.RealInput InPort1[3]
        "State information signal input vector"      annotation (extent=[-10,
            -100; 10, -80], rotation=90);
    equation
      S =InPort1[1];
      V =InPort1[2];
      M =InPort1[3];
      Exist = abs(u) > eps_v;
      f1 = u;
      f2 = if Exist then (S/V)*f1 else 0;
      y = f2;
    end SV;

    model HE "Heat exchange element"
      extends Interfaces.ModTwoPort(InPort1(redeclare type SignalType =
              Modelica.SIunits.ThermalConductance));
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[-76, 80; 72, -80],
            string="HE",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(
            extent=[-30, -58; 28, -76],
            string="lambda",
            style(color=0))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Diagram(Text(
            extent=[-2, -68; 32, -78],
            string="lambda",
            style(color=0))),
        Documentation(info="<html>
This element models the exchange of heat by means of diffusion (temperature equilibration) between two neighboring materials.  Heat exchange occurs if and only if positive quantities of both materials are present.
</html>"));
      Junctions.J0p11 J0p11_1 annotation (extent=[-90, -10; -70, 10]);
      BondLib.Bonds.fBond B1 annotation (extent=[-70, -10; -50, 10]);
      BondLib.Junctions.J1p3 J1p3_1 annotation (extent=[-10, 10; 10, -10]);
      BondLib.Bonds.eBond B3 annotation (extent=[10, -10; 30, 10]);
      BondLib.Junctions.J0p3 J0p3_1 annotation (extent=[-50, 10; -30, -10]);
      BondLib.Bonds.fBond B2 annotation (extent=[-30, -10; -10, 10]);
      BondLib.Junctions.J0p3 J0p3_2 annotation (extent=[30, 10; 50, -10]);
      BondLib.Bonds.eBond B4 annotation (extent=[50, -10; 70, 10]);
      Junctions.J0p11 J0p11_2 annotation (extent=[90, -10; 70, 10]);
      BondLib.Bonds.fBond B5 annotation (extent=[-10, 10; 10, 30], rotation=90);
      BondLib.Junctions.J0p3 J0p3_3 annotation (extent=[-10, 30; 10, 50]);
      BondLib.Bonds.fBond B6 annotation (extent=[10, 30; 30, 50]);
      BondLib.Bonds.eBond B7 annotation (extent=[50, 30; 70, 50]);
      BondLib.Bonds.fBond B8 annotation (extent=[-30, 30; -10, 50], rotation=
            180);
      BondLib.Bonds.eBond B9 annotation (extent=[-70, 30; -50, 50], rotation=
            180);
      Modelica.Blocks.Logical.And AND1          annotation (extent=[-10, 60;
            10, 80], rotation=-90);
      Modelica.Blocks.Math.Gain Gain1(k=0.5)   annotation (extent=[-10, -60;
            10, -40], rotation=90);
      Utilities.mGSth2 mGSth2_1 annotation (extent=[30,30; 50,50]);
      Utilities.mGSth2 mGSth2_2 annotation (extent=[-30,30; -50,50]);
    equation
      connect(ThBondCon1, J0p11_1.ThBondCon1) annotation (points=[-100,0; -90,0],
                     style(color=8));
      connect(J0p11_1.BondCon1, B1.eBondCon1) annotation (points=[-70, 0; -70,
              0], style(color=8));
      connect(B1.fBondCon1, J0p3_1.BondCon1) annotation (points=[-50, 0; -50,
            0], style(color=8));
      connect(J0p3_1.BondCon2, B2.eBondCon1) annotation (points=[-30, 0; -30,
            0], style(color=8));
      connect(B2.fBondCon1, J1p3_1.BondCon1) annotation (points=[-10, 0; -10,
            0], style(color=8));
      connect(J1p3_1.BondCon2, B3.fBondCon1) annotation (points=[10, 0; 10, 0],
            style(color=8));
      connect(B3.eBondCon1, J0p3_2.BondCon1) annotation (points=[30, 0; 30, 0],
            style(color=8));
      connect(B4.fBondCon1, J0p3_2.BondCon2) annotation (points=[50, 0; 50, 0],
            style(color=8));
      connect(B4.eBondCon1, J0p11_2.BondCon1) annotation (points=[70, 0; 70, 0],
               style(color=8));
      connect(J0p11_2.ThBondCon1, ThBondCon2) annotation (points=[90,0; 100,0],
               style(color=8));
      connect(J1p3_1.BondCon3, B5.eBondCon1) annotation (points=[0,10;
            -6.12323e-016,10],
            style(color=8));
      connect(B5.fBondCon1, J0p3_3.BondCon3) annotation (points=[6.12323e-016,
            30; 0,30],
            style(color=8));
      connect(J0p3_3.BondCon2, B6.eBondCon1) annotation (points=[10, 40; 10,
            40], style(color=8));
      connect(B7.eBondCon1, J0p3_2.BondCon3) annotation (points=[70, 40; 74,
            40; 74, 20; 40, 20; 40, 10], style(color=8));
      connect(J0p3_3.BondCon1, B8.eBondCon1) annotation (points=[-10, 40; -10,
              40], style(color=8));
      connect(B9.eBondCon1, J0p3_1.BondCon3) annotation (points=[-70, 40; -74,
              40; -74, 20; -40, 20; -40, 10], style(color=8));
      connect(J0p11_1.BooleanOutPort1,AND1.u2)       annotation (points=[-69,10;
            -64,10; -64,12; -80,12; -80,88; -8,88; -8,82],         style(color=
              5));
      connect(J0p11_2.BooleanOutPort1,AND1.u1)       annotation (points=[69,10;
            66,10; 66,14; 80,14; 80,88; -7.34788e-016,88; -7.34788e-016,82],
                                                               style(color=5));
      connect(mGSth2_1.BondCon1, B6.fBondCon1) annotation (points=[30,40; 30,40],
          style(color=8, rgbcolor={192,192,192}));
      connect(mGSth2_1.BondCon2, B7.fBondCon1) annotation (points=[50,40; 50,40],
          style(color=8, rgbcolor={192,192,192}));
      connect(AND1.y, mGSth2_1.u) annotation (points=[6.73556e-016,59;
            6.73556e-016,54; 40,54; 40,49], style(color=5, rgbcolor={255,0,255}));
      connect(mGSth2_2.BondCon2, B9.fBondCon1) annotation (points=[-50,40; -50,
            40], style(color=8, rgbcolor={192,192,192}));
      connect(mGSth2_2.BondCon1, B8.fBondCon1) annotation (points=[-30,40; -30,
            40], style(color=8, rgbcolor={192,192,192}));
      connect(AND1.y, mGSth2_2.u) annotation (points=[6.73556e-016,59;
            6.73556e-016,54; -40,54; -40,49], style(color=5, rgbcolor={255,0,
              255}));
      connect(Gain1.y, mGSth2_2.s) annotation (points=[6.73556e-016,-39;
            6.73556e-016,-20; -20,-20; -20,24; -40,24; -40,31], style(color=74,
            rgbcolor={0,0,127}));
      connect(Gain1.y, mGSth2_1.s) annotation (points=[6.73556e-016,-39;
            6.73556e-016,-20; 20,-20; 20,24; 40,24; 40,31], style(color=74,
            rgbcolor={0,0,127}));
      connect(Gain1.u, InPort1) annotation (points=[-7.34788e-016,-62;
            -7.34788e-016,-71; 0,-71; 0,-90], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
    end HE;

    model PVE "Pressure/volume exchange element"
      extends Interfaces.TwoPort;
      parameter Real G(unit="m4.s/kg") = 1
        "Bondgraphic conductance of pressure/volume exchanger";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[-76, 80; 72, -80],
            string="PVE",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(extent=[-78, -48; 80, -88], string="G=%G")),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Diagram,
        Documentation(info="<html>
This element models the so-called \"volume work,\" i.e., the equilibration of pressures in neighboring materials by adjusting the volume.  Notice that volume flows in opposite direction to the pressure gradient.  If the pressure on the left-hand side is larger than that on the right-hand side, the movable membrane between the two volumes will move to the right, thereby making the volume to the left bigger and that to the right smaller. <p>

Consequently, the conductance values of the two <b>mGS</b> elements must be negative, as a positive pressure gradient produces a negative volume flow.  The external conductance value (a parameter of the <b>PVE</b> element) must nevertheless be specified positive.  The value is being negated internally to the model. <p>

In the process of pressure equilibration, entropy is being generated that is then added to equal parts to the entropy storages of both materials.  The two bonds to the left and the right of each <b>mGS</b> element both point at the element, symbolizing that the the volumetric flow in the internal energy assumes the opposite sign in comparison with the heat flow.  However, both flows are in fact negative due to the negative conductance value. <p>

Pressure equilibration occurs if and only if positive quantities of both materials are present.
</html>"));
      Junctions.J0p12 J0p12_1 annotation (extent=[-90, -10; -70, 10]);
      BondLib.Bonds.fBond B1 annotation (extent=[-30, 10; -10, 30]);
      BondLib.Junctions.J1p3 J1p3_1 annotation (extent=[-10, 10; 10, 30]);
      BondLib.Bonds.eBond B2 annotation (extent=[10, 10; 30, 30]);
      Junctions.J0p12 J0p12_2 annotation (extent=[90, -10; 70, 10]);
      BondLib.Bonds.fBond B3 annotation (extent=[-10, -10; 10, 10], rotation=-
            90);
      BondLib.Junctions.J0p3 J0p3_1 annotation (extent=[-10, -10; 10, -30]);
      BondLib.Bonds.fBond B4 annotation (extent=[10, -30; 30, -10]);
      BondLib.Bonds.fBond B6 annotation (extent=[-30, -30; -10, -10], rotation=
           -180);
      Modelica.Blocks.Logical.And AND1          annotation (extent=[-10, 60;
            10, 80], rotation=-90);
      Utilities.mGS2 mGS2_1(G=-G/2)
                                   annotation (extent=[30,-30; 50,-10]);
      Utilities.mGS2 mGS2_2(G=-G/2)
                                   annotation (extent=[-30,-30; -50,-10]);
      BondLib.Bonds.fBond B7 annotation (extent=[-70,-30; -50,-10]);
      BondLib.Bonds.fBond B5 annotation (extent=[50,-30; 70,-10],     rotation=
           -180);
    equation
      connect(ThBondCon1, J0p12_1.ThBondCon1) annotation (points=[-100,0; -90,0],
                     style(color=8));
      connect(B1.fBondCon1, J1p3_1.BondCon1) annotation (points=[-10, 20; -10,
              20], style(color=8));
      connect(J0p12_1.BondCon2, B1.eBondCon1) annotation (points=[-80, 10; -80,
              20; -30, 20], style(color=8));
      connect(J1p3_1.BondCon2, B2.fBondCon1) annotation (points=[10, 20; 10,
            20], style(color=8));
      connect(J0p12_2.ThBondCon1, ThBondCon2) annotation (points=[90,0; 100,0],
               style(color=8));
      connect(B2.eBondCon1, J0p12_2.BondCon2) annotation (points=[30, 20; 80,
            20; 80, 10], style(color=8));
      connect(J1p3_1.BondCon3, B3.eBondCon1) annotation (points=[0,10;
            -6.12323e-016,10],
            style(color=8));
      connect(B3.fBondCon1, J0p3_1.BondCon3) annotation (points=[6.12323e-016,
            -10; 0,-10],
                 style(color=8));
      connect(J0p3_1.BondCon2, B4.eBondCon1) annotation (points=[10, -20; 10,
            -20], style(color=8));
      connect(J0p3_1.BondCon1, B6.eBondCon1) annotation (points=[-10, -20; -10,
              -20], style(color=8));
      connect(J0p12_1.BooleanOutPort1,AND1.u2)       annotation (points=[-69,10;
            -60,10; -60,90; -8,90; -8,82],         style(color=5));
      connect(J0p12_2.BooleanOutPort1,AND1.u1)       annotation (points=[69,10;
            60,10; 60,90; -7.34788e-016,90; -7.34788e-016,82],
                                               style(color=5));
      connect(B4.fBondCon1, mGS2_1.BondCon1) annotation (points=[30,-20; 30,-20],
          style(color=8, rgbcolor={192,192,192}));
      connect(AND1.y, mGS2_1.u) annotation (points=[6.73556e-016,59;
            6.73556e-016,50; 40,50; 40,-11], style(color=5, rgbcolor={255,0,255}));
      connect(B6.fBondCon1, mGS2_2.BondCon1) annotation (points=[-30,-20; -30,
            -20], style(color=8, rgbcolor={192,192,192}));
      connect(AND1.y, mGS2_2.u) annotation (points=[6.73556e-016,59;
            6.73556e-016,50; -40,50; -40,-11], style(color=5, rgbcolor={255,0,
              255}));
      connect(B7.fBondCon1, mGS2_2.BondCon2) annotation (points=[-50,-20; -50,
            -20], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(J0p12_1.BondCon1, B7.eBondCon1) annotation (points=[-70,0; -70,
            -20], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(mGS2_1.BondCon2, B5.fBondCon1) annotation (points=[50,-20; 50,-20],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B5.eBondCon1, J0p12_2.BondCon1) annotation (points=[70,-20; 70,0],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
    end PVE;

    model ME "Mass exchange element"
      extends Interfaces.TwoPort;
      parameter Modelica.SIunits.Power G=1
        "Bondgraphic conductance of mass exchanger";
      annotation (
        Coordsys(
          extent=[-100,-100; 100,100],
          grid=[2, 2],
          component=[20, 20],
          scale=0.1),
        Diagram,
        Icon(
          Text(
            extent=[-72, 80; 68, -80],
            string="ME",
            style(color=41)),
          Text(extent=[-70,90; 70,50],    string="%name"),
          Text(extent=[-78,-48; 80,-88],     string="G=%G")),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This element models the equilibration of Gibbs potential.  Such equilibration occurs for example when two fluids that do not react chemically with each other are being mixed.  Their temperature and pressure values may be identical (ambient temperature and pressure), but their Gibbs potentials are different.  In the process of mixing, the Gibbs potentials equilibrate.  In the process, mixing entropy is being produced.
</html>"));
      BondLib.Bonds.fBond B1 annotation (extent=[-30,-50; -10,-30]);
      BondLib.Junctions.J1p3 J1p3_1 annotation (extent=[-10,-30; 10,-50]);
      BondLib.Bonds.eBond B2 annotation (extent=[10,-50; 30,-30]);
      BondLib.Bonds.fBond B3 annotation (extent=[-10,-30; 10,-10],  rotation=90);
      BondLib.Junctions.J0p3 J0p3_1 annotation (extent=[-10,-10; 10,10]);
      BondLib.Bonds.fBond B4 annotation (extent=[10,-10; 30,10]);
      BondLib.Bonds.eBond B5 annotation (extent=[50,-10; 70,10]);
      BondLib.Bonds.fBond B6 annotation (extent=[-30,-10; -10,10],    rotation=
           -180);
      BondLib.Bonds.eBond B7 annotation (extent=[-70,-10; -50,10],    rotation=
           180);
      Modelica.Blocks.Logical.And AND1          annotation (extent=[-10,50; 10,
            70],     rotation=-90);
      Utilities.mGS2 mGS2_1(G=G/2) annotation (extent=[30,-10; 50,10]);
      Utilities.mGS2 mGS2_2(G=G/2) annotation (extent=[-30,-10; -50,10]);
      Junctions.J0p13 j0p13_1 annotation (extent=[-90,-10; -70,10]);
      Junctions.J0p13 j0p13_2 annotation (extent=[90,-10; 70,10]);
      BondLib.Bonds.eBond B8 annotation (extent=[-90,10; -70,30],     rotation=270);
      BondLib.Bonds.eBond B9 annotation (extent=[70,10; 90,30],       rotation=270);
      BondLib.Sources.Sf Sf1(f0=0)
        annotation (extent=[-90,30; -70,50], rotation=90);
      BondLib.Sources.Sf Sf2(f0=0)
        annotation (extent=[70,30; 90,50], rotation=90);
    equation
      connect(B1.fBondCon1,J1p3_1. BondCon1) annotation (points=[-10,-40; -10,
            -40],  style(color=8));
      connect(J1p3_1.BondCon2,B2. fBondCon1) annotation (points=[10,-40; 10,-40],
                 style(color=8));
      connect(J0p3_1.BondCon2,B4. eBondCon1) annotation (points=[10,0; 10,0],
                  style(color=8));
      connect(J0p3_1.BondCon1,B6. eBondCon1) annotation (points=[-10,0; -10,
            1.22465e-015],
                    style(color=8));
      connect(B4.fBondCon1,mGS2_1. BondCon1) annotation (points=[30,0; 30,0],
          style(color=8, rgbcolor={192,192,192}));
      connect(B5.fBondCon1,mGS2_1. BondCon2) annotation (points=[50,0; 50,0],
          style(color=8, rgbcolor={192,192,192}));
      connect(AND1.y,mGS2_1. u) annotation (points=[6.73556e-016,49; 0,54; 0,40;
            40,40; 40,9],                    style(color=5, rgbcolor={255,0,255}));
      connect(B7.fBondCon1,mGS2_2. BondCon2) annotation (points=[-50,
            -1.22465e-015; -50,0],
                  style(color=8, rgbcolor={192,192,192}));
      connect(B6.fBondCon1,mGS2_2. BondCon1) annotation (points=[-30,
            -1.22465e-015; -30,0],
                  style(color=8, rgbcolor={192,192,192}));
      connect(AND1.y,mGS2_2. u) annotation (points=[6.73556e-016,49;
            6.73556e-016,40; -40,40; -40,9],   style(color=5, rgbcolor={255,0,
              255}));
      connect(j0p13_2.ThBondCon1, ThBondCon2) annotation (points=[90,0; 100,0],
          style(color=8, rgbcolor={192,192,192}));
      connect(j0p13_1.ThBondCon1, ThBondCon1) annotation (points=[-90,0; -100,0],
          style(color=8, rgbcolor={192,192,192}));
      connect(B5.eBondCon1, j0p13_2.BondCon1) annotation (points=[70,0; 70,0],
          style(color=8, rgbcolor={192,192,192}));
      connect(B7.eBondCon1, j0p13_1.BondCon1) annotation (points=[-70,
            1.22465e-015; -70,0], style(color=8, rgbcolor={192,192,192}));
      connect(j0p13_1.BooleanOutPort1, AND1.u2) annotation (points=[-69,10; -60,
            10; -60,80; -8,80; -8,72], style(color=5, rgbcolor={255,0,255}));
      connect(j0p13_2.BooleanOutPort1, AND1.u1) annotation (points=[69,10; 60,
            10; 60,80; 0,80; 0,72; -7.34788e-016,72], style(color=5, rgbcolor={
              255,0,255}));
      connect(J0p3_1.BondCon3, B3.fBondCon1) annotation (points=[0,-10;
            6.12323e-016,-10], style(color=8, rgbcolor={192,192,192}));
      connect(J1p3_1.BondCon3, B3.eBondCon1) annotation (points=[0,-30;
            -6.12323e-016,-30], style(color=8, rgbcolor={192,192,192}));
      connect(j0p13_1.BondCon3, B1.eBondCon1) annotation (points=[-80,-10; -80,
            -40; -30,-40], style(color=8, rgbcolor={192,192,192}));
      connect(B2.eBondCon1, j0p13_2.BondCon3) annotation (points=[30,-40; 80,
            -40; 80,-10], style(color=8, rgbcolor={192,192,192}));
      connect(B8.eBondCon1, j0p13_1.BondCon2) annotation (points=[-80,10; -80,
            10], style(color=8, rgbcolor={192,192,192}));
      connect(B9.eBondCon1, j0p13_2.BondCon2) annotation (points=[80,10; 80,10],
          style(color=8, rgbcolor={192,192,192}));
      connect(Sf1.BondCon1, B8.fBondCon1) annotation (points=[-80,30; -80,30],
          style(color=8, rgbcolor={192,192,192}));
      connect(Sf2.BondCon1, B9.fBondCon1) annotation (points=[80,30; 80,30],
          style(color=8, rgbcolor={192,192,192}));
    end ME;

    model PE "Potential equilibration element"
      extends Interfaces.ModTwoPort(InPort1(redeclare type SignalType =
              Modelica.SIunits.ThermalConductance));
      parameter Real G1(unit="m4.s/kg") = 1
        "Bondgraphic conductance of pressure/volume exchanger";
      parameter Modelica.SIunits.Power G2=1
        "Bondgraphic conductance of mass exchanger";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram,
        Icon(
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(
            extent=[-76, 80; 72, -80],
            string="PE",
            style(color=41)),
          Text(
            extent=[-30,-58; 28,-76],
            string="lambda",
            style(color=0))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
The potential equilibration model equilibrates the three potentials (temperature, pressure, and Gibbs potential) of two volumes neighboring each other. <p>

This element is modeled by a parallel connection of a heat exchanger, a pressure/volume exchanger, and a mass exchanger.
</html>"));
      Junctions.J0p4 J0p4_1 annotation (extent=[-80,-20; -40,20]);
      HE HE1 annotation (extent=[-10,30; 10,50]);
      PVE PVE1(G=G1) annotation (extent=[-10,-10; 10,10]);
      ME ME1(G=G2) annotation (extent=[-10,-50; 10,-30]);
      Bonds.fThermoBond B1 annotation (extent=[-30,-10; -10,10]);
      Bonds.eThermoBond B2 annotation (extent=[10,-10; 30,10]);
      Junctions.J0p4 J0p4_2 annotation (extent=[40,-20; 80,20]);
      Bonds.fThermoBond B3 annotation (extent=[-30,30; -10,50]);
      Bonds.eThermoBond B4 annotation (extent=[10,30; 30,50]);
      Bonds.fThermoBond B5 annotation (extent=[-30,-50; -10,-30]);
      Bonds.eThermoBond B6 annotation (extent=[10,-50; 30,-30]);
    equation
      connect(J0p4_1.ThBondCon2, B1.eThBondCon1) annotation (points=[-40,0; -30,
            0],         style(color=8));
      connect(B1.fThBondCon1, PVE1.ThBondCon1) annotation (points=[-10,0; -10,0],
                  style(color=8));
      connect(PVE1.ThBondCon2, B2.fThBondCon1) annotation (points=[10,0; 10,0],
                style(color=8));
      connect(ThBondCon1, J0p4_1.ThBondCon1) annotation (points=[-100,0; -80,0],
                style(color=8));
      connect(B2.eThBondCon1, J0p4_2.ThBondCon1) annotation (points=[30,0; 40,0],
                  style(color=8));
      connect(J0p4_2.ThBondCon2, ThBondCon2) annotation (points=[80,0; 100,0],
            style(color=8));
      connect(J0p4_1.ThBondCon4, B3.eThBondCon1) annotation (points=[-60,20;
            -60,40; -30,40],   style(color=8));
      connect(B3.fThBondCon1, HE1.ThBondCon1) annotation (points=[-10,40; -10,
            40],   style(color=8));
      connect(HE1.ThBondCon2, B4.fThBondCon1) annotation (points=[10,40; 10,40],
                 style(color=8));
      connect(B4.eThBondCon1, J0p4_2.ThBondCon4) annotation (points=[30,40; 60,
            40; 60,20],      style(color=8));
      connect(J0p4_1.ThBondCon3, B5.eThBondCon1) annotation (points=[-60,-20;
            -60,-40; -30,-40],     style(color=8));
      connect(B5.fThBondCon1, ME1.ThBondCon1) annotation (points=[-10,-40; -10,
            -40],     style(color=8));
      connect(ME1.ThBondCon2, B6.fThBondCon1) annotation (points=[10,-40; 10,
            -40],   style(color=8));
      connect(B6.eThBondCon1, J0p4_2.ThBondCon3) annotation (points=[30,-40; 60,
            -40; 60,-20],      style(color=8));
      connect(InPort1, HE1.InPort1) annotation (points=[0,-90; 0,-70; -48,-70;
            -48,20; 0,20; 0,31], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
    end PE;

    model RFq "Resistive field representing a small forced volume flow"
      extends Interfaces.ModTwoPort(InPort1(redeclare type SignalType =
              Modelica.SIunits.VolumeFlowRate));
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[-76, 80; 40, -80],
            string="RF",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(
            extent=[-12, -52; 10, -76],
            string="q",
            style(color=0)),
          Text(
            extent=[32, 8; 70, -40],
            string="q",
            style(color=41)),
          Line(points=[-66, -48; 72, -48], style(color=41)),
          Line(points=[46, -42; 72, -48; 46, -54], style(color=41))),
        Diagram(
          Line(points=[10, -40; 10, -40], style(color=8)),
          Line(points=[30, -40; 30, -40], style(color=8)),
          Text(
            extent=[0, -70; 12, -82],
            string="q",
            style(color=57)),
          Line(points=[0, 40; 0, 40], style(color=8)),
          Line(points=[0, 20; 0, 20], style(color=8)),
          Ellipse(extent=[-1,-69; 1,-71], style(
              color=3,
              rgbcolor={0,0,229},
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This element models a resistive field representing a small forced volume flow.  The <b>mSF</b> thermo-bond graph element is used to represent the forced volume flow.  The excess entropy generated by the accompanying potential equilibration is reintroduced at the volume located downstream. <p>

This model should only be used for small material flows, as it does not account for all phenomena that accompany convective flows.  It is primarily used to model the volume flow between the bulk of a material and its boundary layer.
</html>"));
      Junctions.J0p3 J0p3_1 annotation (extent=[50, -30; 70, -50]);
      Junctions.J0p11 J0p11_1 annotation (extent=[70, 10; 50, -10], rotation=-
            90);
      Bonds.eThermoBond B10 annotation (extent=[-70, -30; -50, -10], rotation=
            270);
      Bonds.fThermoBond B1 annotation (extent=[-40, -50; -20, -30]);
      Bonds.eThermoBond B2 annotation (extent=[20, -50; 40, -30]);
      Junctions.J0p3 J0p3_2 annotation (extent=[-70, -30; -50, -50]);
      BondLib.Bonds.eBond B9 annotation (extent=[-70, 10; -50, 30], rotation=-
            90);
      BondLib.Junctions.J0p3 J0p3_3 annotation (extent=[-10, 30; 10, 50]);
      Bonds.eThermoBond B6 annotation (extent=[50, -30; 70, -10], rotation=270);
      Junctions.J0p11 J0p11_2 annotation (extent=[-50, 10; -70, -10], rotation=
           -90);
      BondLib.Junctions.J1p3 J1p3_2 annotation (extent=[30, 50; 50, 30]);
      BondLib.Bonds.Bond B4 annotation (extent=[10, 30; 30, 50]);
      BondLib.Bonds.eBond B3 annotation (extent=[-10, -10; 10, 10], rotation=
            90);
      BondLib.Bonds.Bond B11 annotation (extent=[-50, 50; -30, 70], rotation=
            90);
      BondLib.Switches.Sw Sw1 annotation (extent=[-50, 90; -30, 70], rotation=
            -90);
      BondLib.Bonds.Bond B8 annotation (extent=[-30, 30; -10, 50], rotation=-
            180);
      BondLib.Junctions.J1p3 J1p3_3 annotation (extent=[-50, 50; -30, 30]);
      BondLib.Bonds.eBond B5 annotation (extent=[50, 10; 70, 30], rotation=270);
      BondLib.Bonds.Bond B7 annotation (extent=[30, 50; 50, 70], rotation=90);
      BondLib.Switches.Sw Sw2 annotation (extent=[30, 90; 50, 70], rotation=-
            90);
      Modelica.Blocks.Logical.LessThreshold LessThan0     annotation (extent=[
            40, -80; 60, -60]);
      Sources.mSf mSf1 annotation (extent=[-10, -50; 10, -30]);
      Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual0
        annotation (extent=[-40,-80; -60,-60]);
    equation
      connect(mSf1.BondCon1, B3.fBondCon1) annotation (points=[0,-30; 0,-20; 0,
            -10; -6.12323e-016,-10],
                  style(color=8));
      connect(B1.fThBondCon1, mSf1.ThBondCon1) annotation (points=[-20, -40; -
            10, -40], style(color=8));
      connect(mSf1.ThBondCon2, B2.fThBondCon1) annotation (points=[10, -40; 20,
              -40], style(color=8));
      connect(B3.eBondCon1, J0p3_3.BondCon3) annotation (points=[6.12323e-016,
            10; 6.12323e-016,20; 0,20; 0,30],
            style(color=8));
      connect(J0p3_3.BondCon1, B8.BondCon1) annotation (points=[-10, 40; -10.2,
              40], style(color=8));
      connect(J0p3_3.BondCon2, B4.BondCon1) annotation (points=[10, 40; 10.2,
            40], style(color=8));
      connect(B8.BondCon2, J1p3_3.BondCon2) annotation (points=[-30, 40; -30,
            40], style(color=8));
      connect(J1p3_3.BondCon3, B11.BondCon1) annotation (points=[-40, 50; -40,
              50.2], style(color=8));
      connect(B11.BondCon2, Sw1.BondCon1) annotation (points=[-40, 70; -40, 70],
               style(color=8));
      connect(J0p3_2.ThBondCon2, B1.eThBondCon1) annotation (points=[-50, -40;
              -40, -40], style(color=8));
      connect(ThBondCon1, J0p3_2.ThBondCon1) annotation (points=[-100,0; -80,0;
            -80,-40; -70,-40],      style(color=8));
      connect(B10.eThBondCon1, J0p3_2.ThBondCon3) annotation (points=[-60, -30;
              -60, -30], style(color=8));
      connect(J0p11_2.ThBondCon1, B10.fThBondCon1) annotation (points=[-60, -
            10; -60, -10], style(color=8));
      connect(B9.eBondCon1, J0p11_2.BondCon1) annotation (points=[-60, 10; -60,
              10], style(color=8));
      connect(J1p3_3.BondCon1, B9.fBondCon1) annotation (points=[-50, 40; -60,
              40; -60, 30], style(color=8));
      connect(B4.BondCon2, J1p3_2.BondCon1) annotation (points=[30, 40; 30, 40],
               style(color=8));
      connect(J1p3_2.BondCon3, B7.BondCon1) annotation (points=[40, 50; 40,
            50.2], style(color=8));
      connect(B7.BondCon2, Sw2.BondCon1) annotation (points=[40, 70; 40, 70],
          style(color=8));
      connect(B2.eThBondCon1, J0p3_1.ThBondCon1) annotation (points=[40, -40;
            50, -40], style(color=8));
      connect(B6.eThBondCon1, J0p3_1.ThBondCon3) annotation (points=[60, -30;
            60, -30], style(color=8));
      connect(J0p3_1.ThBondCon2, ThBondCon2) annotation (points=[70,-40; 80,-40;
            80,0; 100,0],       style(color=8));
      connect(B6.fThBondCon1, J0p11_1.ThBondCon1) annotation (points=[60, -10;
              60, -10], style(color=8));
      connect(B5.eBondCon1, J0p11_1.BondCon1) annotation (points=[60, 10; 60,
            10], style(color=8));
      connect(J1p3_2.BondCon2, B5.fBondCon1) annotation (points=[50, 40; 60,
            40; 60, 30], style(color=8));
      connect(LessThan0.y,       Sw2.BooleanInPort1) annotation (points=[61,-70;
            86,-70; 86,94; 40,94; 40,89],         style(color=5));
      connect(InPort1, mSf1.InPort1) annotation (points=[0,-90; 0,-49], style(
            color=74, rgbcolor={0,0,127}));
      connect(InPort1, LessThan0.u) annotation (points=[0,-90; 0,-70; 38,-70],
          style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(GreaterEqual0.y, Sw1.BooleanInPort1)         annotation (points=[
            -61,-70; -86,-70; -86,94; -40,94; -40,89], style(
          color=5,
          rgbcolor={255,0,255},
          smooth=0));
      connect(InPort1, GreaterEqual0.u)         annotation (points=[0,-90; 0,
            -70; -38,-70], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
    end RFq;

    model RFV
      "Resistive field representing pressure equilibration without volume adjustment"
      extends Interfaces.TwoPort;
      parameter Real G(unit="m4.s/kg") = 1
        "Bondgraphic conductance of pressure/volume exchange";
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Text(
            extent=[-76, 80; 40, -80],
            string="RF",
            style(color=41)),
          Text(
            extent=[32, 8; 70, -40],
            string="V",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Line(points=[-66, -48; 72, -48], style(color=41)),
          Line(points=[46, -42; 72, -48; 46, -54], style(color=41))),
        Documentation(info="<html>
This element models the pressure equilibration between two neighboring volumes without volume adjustment.  This element is primarily used to model the pressure equilibration between the bulk of a material and its boundary layer.  Since the boundary layer is small and artificial (a numerical artefact), its volume should be kept constant to avoid that the boundary layer either grows or disappears altogether. <p>

The model uses a normal <b>PVE</b> element together with a flow sensor that measures the resulting volume flow.  A counter volume flow of equal magnitude is then enforced using an <b>RFq</b> element to push the volume right back to the other side.
</html>"),
        Diagram);
      Junctions.J0p3 J0p3_1 annotation (extent=[-80, -20; -40, 20], rotation=-
            90);
      Junctions.J0p3 J0p3_2 annotation (extent=[80, -20; 40, 20], rotation=-90);
      Bonds.eThermoBond B1 annotation (extent=[20, 20; 60, 60]);
      Bonds.fThermoBond B2 annotation (extent=[20, -60; 60, -20], rotation=180);
      Sensors.fDf Df1 annotation (extent=[-60, 20; -20, 60]);
      PVE PVE1(G=G) annotation (extent=[-20, 20; 20, 60]);
      RFq RFq1 annotation (extent=[-20, -60; 20, -20], rotation=180);
      Bonds.eThermoBond B3 annotation (extent=[-60, -60; -20, -20], rotation=
            180);
    equation
      connect(ThBondCon1, J0p3_1.ThBondCon3) annotation (points=[-100,0; -87,0;
            -87,-1.22465e-015; -80,-1.22465e-015],          style(color=8));
      connect(J0p3_2.ThBondCon3, ThBondCon2) annotation (points=[80,
            -1.22465e-015; 87,-1.22465e-015; 87,0; 100,0],  style(color=8));
      connect(J0p3_1.ThBondCon1, Df1.eThBondCon1) annotation (points=[-60, 20;
            -60, 40], style(color=8));
      connect(Df1.fThBondCon1, PVE1.ThBondCon1) annotation (points=[-20, 40; -
            20, 40], style(color=8));
      connect(PVE1.ThBondCon2, B1.fThBondCon1) annotation (points=[20, 40; 20,
              40], style(color=8));
      connect(B1.eThBondCon1, J0p3_2.ThBondCon1) annotation (points=[60, 40;
            60, 20], style(color=8));
      connect(J0p3_2.ThBondCon2, B2.eThBondCon1) annotation (points=[60, -20;
            60, -40], style(color=8));
      connect(B2.fThBondCon1, RFq1.ThBondCon1) annotation (points=[20, -40; 20,
              -40], style(color=8));
      connect(RFq1.ThBondCon2, B3.fThBondCon1) annotation (points=[-20, -40; -
            20, -40], style(color=8));
      connect(B3.eThBondCon1, J0p3_1.ThBondCon2) annotation (points=[-60, -40;
              -60, -20], style(color=8));
      connect(Df1.OutPort2, RFq1.InPort1) annotation (points=[-20,18; -20,0;
            2.20436e-015,0; 2.20436e-015,-22], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
    end RFV;

    model VF "Free volume flow element"
      extends Interfaces.TwoPort;
      parameter Real R(unit="kg/(m4.s)") = 1 "Resistance of friction";
      parameter Real I(unit="kg/m4") = 1 "Inductance of inertia";
      parameter Modelica.SIunits.VolumeFlowRate q0 = 0 "Inital volume flow";
      parameter Modelica.SIunits.VolumeFlowRate MinVolFlow = Modelica.Constants.small
        "Minimum volume flow";
      annotation (
        Coordsys(
          extent=[-100,-200; 100,200],
          grid=[2,2],
          component=[20, 20],
          scale=0.1),
        Diagram(
          Line(points=[-50, -20; -50, -20], style(color=8)),
          Line(points=[-10, -20; -10, -20], style(color=8)),
          Line(points=[-30, -20; -30, -20], style(color=8)),
          Line(points=[10, -20; 10, -20], style(color=8)),
          Line(points=[30, -20; 30, -20], style(color=8)),
          Line(points=[50, -20; 50, -20], style(color=8)),
          Line(points=[-62, -48; -62, -48], style(color=8)),
          Line(points=[-64, -44; -64, -44], style(color=8)),
          Line(points=[18, -48; 18, -48], style(color=8)),
          Line(points=[50, -50; 50, -50], style(color=8)),
          Ellipse(extent=[-5,131; -3,129], style(
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1)),
          Ellipse(extent=[-71,131; -69,129],   style(color=81, fillColor=81)),
          Ellipse(extent=[69,131; 71,129],   style(color=81, fillColor=81)),
          Ellipse(extent=[-63,-109; -61,-111], style(
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1)),
          Ellipse(extent=[99,-129; 101,-131], style(
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1))),
        Icon(
          Text(
            extent=[-60,78; 56,-82],
            style(color=41),
            string="VF"),
          Text(extent=[-74,88; 66,48],   string="%name"),
          Line(points=[-70,-50; 68,-50],   style(color=41)),
          Line(points=[42,-44; 68,-50; 42,-56],    style(color=41))),
        Window(
          x=0.02,
          y=0,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This element models general free volume flow through a pipe segment.  The volume flow represents one segment of a wave equation model.  The top segment of the model represents volume flow.  The flow is measured, and an accompanying mass flow is introduced in the mass flow part of the model (the bottom segment of the model).  An accompanying entropy flow is also introduced in the heat flow part of the model (the center segment). <p>

Also modeled is the friction of the fluid in the pipe.  The generated entropy is sent downstream. <p>

Finally in order to enforce an equivalent mass flow, additional energy is needed.  This energy is taken from the thermal side by reducing the entropy upstream.
</html>"));
      BondLib.Bonds.fBond B1 annotation (extent=[-30, 60; -10, 80]);
      BondLib.Junctions.J1p3 J1p3_1 annotation (extent=[30,-100; 50,-80],
          rotation=-180);
      BondLib.Bonds.eBond B2 annotation (extent=[10, 60; 30, 80]);
      Junctions.J0p13 J0p13_1 annotation (extent=[-90, -60; -70, -40]);
      Junctions.J0p13 J0p13_2 annotation (extent=[90, -60; 70, -40]);
      Sensors.fDs State1 annotation (extent=[-110, -50; -90, -30], rotation=270);
      Sensors.eDs State2 annotation (extent=[90, -50; 110, -30], rotation=90);
      BondLib.Sensors.Df Df1 annotation (extent=[-14,100; 6,120],    rotation=90);
      BondLib.Bonds.eBond B3 annotation (extent=[-14,80; 6,100],    rotation=
            90);
      BondLib.Bonds.eBond B27
                             annotation (extent=[30, -40; 50, -20], rotation=
            -90);
      BondLib.Bonds.fBond B6 annotation (extent=[-70, -60; -50, -40]);
      BondLib.Bonds.eBond B9  annotation (extent=[50, -60; 70, -40]);
      BondLib.Bonds.fBond B7 annotation (extent=[-30, -60; -10, -40]);
      BondLib.Sources.mSf2 mSf2_1 annotation (extent=[-10, -60; 10, -40]);
      BondLib.Bonds.eBond B8 annotation (extent=[10, -60; 30, -40]);
      BondLib.Bonds.fBond B5  annotation (extent=[10,80; 30,100],  rotation=0);
      BondLib.Bonds.eBond B26 annotation (extent=[30, 0; 50, 20], rotation=-90);
      BondLib.Bonds.fBond B15 annotation (extent=[30,-80; 50,-60],
          rotation=270);
      BondLib.Bonds.fBond B18 annotation (extent=[-10, -120; 10, -100],
          rotation=270);
      BondLib.Bonds.fBond B12 annotation (extent=[-50,-80; -30,-60],
          rotation=270);
      BondLib.Bonds.eBond B23 annotation (extent=[-50, -40; -30, -20],
          rotation=270);
      BondLib.Junctions.J1p3 J1p3_2 annotation (extent=[30, 20; 50, 40]);
      BondLib.Bonds.fBond B10 annotation (extent=[-30, -180; -10, -160]);
      BondLib.Bonds.eBond B22 annotation (extent=[-50, 0; -30, 20], rotation=
            270);
      Modelica.Blocks.Logical.Switch Switch1[3]            annotation (extent=
            [-60, 80; -80, 100], rotation=-90);
      Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual0
                                                                annotation (
          extent=[-40, 140; -20, 120], rotation=180);
      BondLib.Bonds.Bond B16 annotation (extent=[50, -100; 70, -80]);
      BondLib.Thermal.RS RS1(R=R) annotation (extent=[30, -20; 50, 0],
          rotation=270);
      BondLib.Bonds.Bond B14 annotation (extent=[-30, -100; -10, -80]);
      BondLib.Switches.Sw Sw1 annotation (extent=[70, -100; 90, -80]);
      BondLib.Bonds.Bond B17 annotation (extent=[10, -100; 30, -80], rotation=
            180);
      BondLib.Junctions.J1p3 J1p3_3 annotation (extent=[-50,-100; -30,-80],
          rotation=-180);
      BondLib.Thermal.RS RS2(R=R) annotation (extent=[-50, -20; -30, 0],
          rotation=-90);
      BondLib.Bonds.Bond B13 annotation (extent=[-70, -100; -50, -80],
          rotation=180);
      BondLib.Switches.Sw Sw2 annotation (extent=[-70, -100; -90, -80]);
      BondLib.Bonds.eBond B19 annotation (extent=[-10, -160; 10, -140],
          rotation=-90);
      BondLib.Junctions.J1p3 J1p3_4 annotation (extent=[-10, -160; 10, -180]);
      BondLib.Bonds.eBond B11 annotation (extent=[10, -180; 30, -160]);
      BondLib.Passive.I I1(I=I, f(start=q0))
                                annotation (extent=[50,100; 30,80],   rotation=180);
      Modelica.Blocks.Logical.LessThreshold LessThan0     annotation (extent=[
            20, 120; 40, 140]);
      SV SV1(eps_v=MinVolFlow)
             annotation (extent=[-72, -120; -52, -140]);
      MV MV1(eps_v=MinVolFlow)
             annotation (extent=[72, -120; 52, -140]);
      Junctions.J0p2 J0p2_1 annotation (extent=[-110, -30; -90, -10], rotation=
           90);
      Junctions.J0p2 J0p2_2 annotation (extent=[90, -30; 110, -10], rotation=
            90);
      BondLib.Junctions.J0p3 J0p3_6 annotation (extent=[-10, -100; 10, -80]);
      BondLib.Bonds.Bond B24 annotation (extent=[10, 20; 30, 40]);
      BondLib.Bonds.Bond B20 annotation (extent=[-30, 20; -10, 40], rotation=
            180);
      BondLib.Bonds.Bond B25 annotation (extent=[50, 20; 70, 40]);
      BondLib.Switches.Sw Sw3 annotation (extent=[70, 20; 90, 40]);
      BondLib.Junctions.J1p3 J1p3_5 annotation (extent=[-50, 20; -30, 40]);
      BondLib.Bonds.Bond B21 annotation (extent=[-70, 20; -50, 40], rotation=
            180);
      BondLib.Switches.Sw Sw4 annotation (extent=[-70, 20; -90, 40]);
      BondLib.Bonds.eBond B4  annotation (extent=[-10,40; 10,60], rotation=-90);
      BondLib.Junctions.J0p3 J0p3_1 annotation (extent=[-10,40; 10,20]);
      BondLib.Junctions.J1p5 j1p5_1 annotation (extent=[-10,80; 10,60]);
      BondLib.Junctions.J0p4 j0p4_1 annotation (extent=[-50,-60; -30,-40]);
      BondLib.Junctions.J0p4 j0p4_2 annotation (extent=[30,-60; 50,-40]);
      BondLib.Sources.mSf3 mSf3_1
        annotation (extent=[10,-140; -10,-120], rotation=-90);
    equation
      connect(B3.eBondCon1, Df1.BondCon1) annotation (points=[-4,100; -4,100],
                  style(color=8));
      connect(State1.fThBondCon1, J0p13_1.ThBondCon1) annotation (points=[-100,
              -50; -90, -50], style(color=8));
      connect(J0p13_1.BondCon1,B6. eBondCon1) annotation (points=[-70, -50;
            -70, -50], style(color=8));
      connect(B9.eBondCon1, J0p13_2.BondCon1)  annotation (points=[70, -50; 70,
              -50], style(color=8));
      connect(J0p13_2.ThBondCon1, State2.fThBondCon1) annotation (points=[90,
            -50; 100, -50], style(color=8));
      connect(B19.eBondCon1, J1p3_4.BondCon3) annotation (points=[6.12323e-016,
            -160; 0,-160],
                   style(color=8));
      connect(B10.fBondCon1, J1p3_4.BondCon1) annotation (points=[-10, -170;
            -10, -170], style(color=8));
      connect(J1p3_4.BondCon2,B11. fBondCon1) annotation (points=[10, -170; 10,
              -170], style(color=8));
      connect(State1.eThBondCon1, J0p2_1.ThBondCon1) annotation (points=[-100,
              -30; -100, -30], style(color=8));
      connect(State2.eThBondCon1, J0p2_2.ThBondCon1) annotation (points=[100,
            -30; 100, -30], style(color=8));
      connect(J0p2_1.ThBondCon2, ThBondCon1) annotation (points=[-100,-10; -100,
            0],        style(color=8));
      connect(J0p2_2.ThBondCon2, ThBondCon2) annotation (points=[100,-10; 100,0],
                   style(color=8));
      connect(J0p3_6.BondCon3,B18. eBondCon1) annotation (points=[0,-100;
            1.83697e-015,-100],
                   style(color=8));
      connect(B17.BondCon2, J0p3_6.BondCon2) annotation (points=[10, -90; 10,
            -90], style(color=8));
      connect(J1p3_1.BondCon2, B17.BondCon1) annotation (points=[30,-90; 29.8,
            -90], style(color=8));
      connect(J1p3_1.BondCon1, B16.BondCon1) annotation (points=[50, -90; 50.2,
              -90], style(color=8));
      connect(B16.BondCon2, Sw1.BondCon1) annotation (points=[70, -90; 70, -90],
               style(color=8));
      connect(B14.BondCon2, J0p3_6.BondCon1) annotation (points=[-10, -90; -10,
              -90], style(color=8));
      connect(J1p3_3.BondCon1,B14. BondCon1) annotation (points=[-30,-90; -29.8,
            -90],   style(color=8));
      connect(B13.BondCon1, J1p3_3.BondCon2) annotation (points=[-50.2,-90; -50,
            -90],      style(color=8));
      connect(B13.BondCon2, Sw2.BondCon1) annotation (points=[-70, -90; -70,
            -90], style(color=8));
      connect(B7.fBondCon1, mSf2_1.BondCon1) annotation (points=[-10, -50; -10,
              -50], style(color=8));
      connect(mSf2_1.BondCon2,B8. fBondCon1) annotation (points=[10, -50; 10,
            -50], style(color=8));
      connect(B24.BondCon2, J1p3_2.BondCon1) annotation (points=[30, 30; 30,
            30], style(color=8));
      connect(J1p3_2.BondCon2,B25. BondCon1) annotation (points=[50, 30; 50.2,
              30], style(color=8));
      connect(B25.BondCon2, Sw3.BondCon1) annotation (points=[70, 30; 70, 30],
            style(color=8));
      connect(B20.BondCon2, J1p3_5.BondCon2) annotation (points=[-30, 30; -30,
              30], style(color=8));
      connect(J1p3_5.BondCon1,B21. BondCon1) annotation (points=[-50, 30;
            -50.2, 30], style(color=8));
      connect(B21.BondCon2, Sw4.BondCon1) annotation (points=[-70, 30; -70, 30],
               style(color=8));
      connect(J1p3_2.BondCon3, B26.fBondCon1) annotation (points=[40, 20; 40,
            20], style(color=8));
      connect(B26.eBondCon1, RS1.BondCon1) annotation (points=[40, 0; 40, 0],
          style(color=8));
      connect(RS1.BondCon2, B27.fBondCon1)
                                          annotation (points=[40, -20; 40, -20],
               style(color=8));
      connect(J1p3_5.BondCon3, B22.fBondCon1) annotation (points=[-40, 20; -40,
              20], style(color=8));
      connect(B22.eBondCon1, RS2.BondCon1) annotation (points=[-40, 0; -40, 0],
            style(color=8));
      connect(RS2.BondCon2,B23. fBondCon1) annotation (points=[-40, -20; -40,
            -20], style(color=8));
      connect(Sw4.BooleanInPort1,GreaterEqual0.y)       annotation (points=[-89,
            30; -100,30; -100,130; -41,130],         style(color=5));
      connect(Sw3.BooleanInPort1,LessThan0.y)        annotation (points=[89,30;
            100,30; 100,130; 41,130],        style(color=5));
      connect(GreaterEqual0.y,       Sw1.BooleanInPort1)
                                                        annotation (points=[-41,
            130; -70,130; -70,164; 134,164; 134,-90; 89,-90],           style(
            color=5));
      connect(J0p13_1.BondCon2, B1.eBondCon1) annotation (points=[-80, -40;
            -80, 0; -60, 0; -60, 70; -30, 70], style(color=8));
      connect(B2.eBondCon1, J0p13_2.BondCon2) annotation (points=[30, 70; 60,
            70; 60, 0; 80, 0; 80, -40], style(color=8));
      connect(LessThan0.y,       Sw2.BooleanInPort1) annotation (points=[41,130;
            70,130; 70,170; -134,170; -134,-90; -89,-90],           style(color=
             5));
      connect(Switch1.y,       SV1.InPort1) annotation (points=[-70,79; -70,60;
            -126,60; -126,-110; -62,-110; -62,-121],         style(color=3));
      connect(GreaterEqual0.y, Switch1[1].u2)
                                             annotation (points=[-41,130; -70,
            130; -70,102], style(color=5, rgbcolor={255,0,255}));
      connect(GreaterEqual0.y, Switch1[2].u2)
                                             annotation (points=[-41,130; -70,
            130; -70,102], style(color=5, rgbcolor={255,0,255}));
      connect(GreaterEqual0.y, Switch1[3].u2)
                                             annotation (points=[-41,130; -70,
            130; -70,102], style(color=5, rgbcolor={255,0,255}));
      connect(B20.BondCon1, J0p3_1.BondCon1) annotation (points=[-10.2,30; -10,
            30], style(color=8, rgbcolor={192,192,192}));
      connect(B24.BondCon1, J0p3_1.BondCon2) annotation (points=[10.2,30; 10,30],
          style(color=8, rgbcolor={192,192,192}));
      connect(J0p3_1.BondCon3, B4.eBondCon1) annotation (points=[0,40;
            6.12323e-016,40], style(color=8, rgbcolor={192,192,192}));
      connect(B1.fBondCon1, j1p5_1.BondCon1) annotation (points=[-10,70; -10,70],
          style(color=8, rgbcolor={192,192,192}));
      connect(j1p5_1.BondCon2, B2.fBondCon1) annotation (points=[10,70; 10,70],
          style(color=8, rgbcolor={192,192,192}));
      connect(B4.fBondCon1, j1p5_1.BondCon5) annotation (points=[-6.12323e-016,
            60; 0,60], style(color=8, rgbcolor={192,192,192}));
      connect(B3.fBondCon1, j1p5_1.BondCon3) annotation (points=[-4,80; -4,80],
          style(color=8, rgbcolor={192,192,192}));
      connect(j1p5_1.BondCon4, B5.eBondCon1)  annotation (points=[4,80; 4,90;
            10,90], style(color=8, rgbcolor={192,192,192}));
      connect(B5.fBondCon1, I1.BondCon1)  annotation (points=[30,90; 30,90],
          style(color=8, rgbcolor={192,192,192}));
      connect(SV1.y, mSf2_1.s) annotation (points=[-51,-130; -20,-130; -20,-70;
            0,-70; 0,-59], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=74,
          rgbfillColor={0,0,218},
          fillPattern=1));
      connect(MV1.InPort1, Switch1.y) annotation (points=[62,-121; 62,-110;
            -126,-110; -126,60; -70,60; -70,79], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=74,
          rgbfillColor={0,0,218},
          fillPattern=1));
      connect(j0p4_1.BondCon1, B6.fBondCon1) annotation (points=[-50,-50; -50,
            -50], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_1.BondCon4, B23.eBondCon1) annotation (points=[-40,-40; -40,
            -40], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_1.BondCon2, B7.eBondCon1) annotation (points=[-30,-50; -30,
            -50], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon1, B8.eBondCon1) annotation (points=[30,-50; 30,-50],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon4, B27.eBondCon1) annotation (points=[40,-40; 40,
            -40], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon2, B9.fBondCon1) annotation (points=[50,-50; 50,-50],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B12.eBondCon1, j0p4_1.BondCon3) annotation (points=[-40,-60; -40,
            -60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B12.fBondCon1, J1p3_3.BondCon3) annotation (points=[-40,-80; -40,
            -80], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(J1p3_1.BondCon3, B15.fBondCon1) annotation (points=[40,-80; 40,
            -80], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon3, B15.eBondCon1) annotation (points=[40,-60; 40,
            -60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B10.eBondCon1, J0p13_1.BondCon3) annotation (points=[-30,-170;
            -94,-170; -94,-70; -80,-70; -80,-60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B11.eBondCon1, J0p13_2.BondCon3) annotation (points=[30,-170; 94,
            -170; 94,-70; 80,-70; 80,-60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(SV1.u, MV1.u) annotation (points=[-74,-130; -100,-130; -100,-190;
            100,-190; 100,-130; 74,-130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Df1.OutPort1, GreaterEqual0.u)
                                            annotation (points=[-4,121; -4,130;
            -18,130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Df1.OutPort1, LessThan0.u) annotation (points=[-4,121; -4,130; 18,
            130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Df1.OutPort1, MV1.u) annotation (points=[-4,121; -4,148; 126,148;
            126,-130; 74,-130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(State2.OutPort1, Switch1.u3) annotation (points=[111,-40; 118,-40;
            118,156; -62,156; -62,102], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(State1.OutPort1, Switch1.u1) annotation (points=[-111,-40; -118,
            -40; -118,112; -78,112; -78,102], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(mSf3_1.BondCon1, B18.fBondCon1) annotation (points=[6.12323e-016,
            -120; -1.83697e-015,-120], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(mSf3_1.BondCon2, B19.fBondCon1) annotation (points=[-6.12323e-016,
            -140; -6.12323e-016,-140], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(MV1.y, mSf3_1.s) annotation (points=[51,-130; 9,-130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
    end VF;

    model FVF "Free volume flow element"
      extends Interfaces.TwoPort;
      parameter Real R(unit="kg/(m4.s)") = 1 "Resistance of friction";
      parameter Modelica.SIunits.VolumeFlowRate MinVolFlow = Modelica.Constants.small
        "Minimum volume flow";
      annotation (
        Coordsys(
          extent=[-100,-200; 100,200],
          grid=[2, 2],
          component=[20, 20],
          scale=0.1),
        Diagram(
          Line(points=[-50, -20; -50, -20], style(color=8)),
          Line(points=[-10, -20; -10, -20], style(color=8)),
          Line(points=[-30, -20; -30, -20], style(color=8)),
          Line(points=[10, -20; 10, -20], style(color=8)),
          Line(points=[30, -20; 30, -20], style(color=8)),
          Line(points=[50, -20; 50, -20], style(color=8)),
          Line(points=[-62, -48; -62, -48], style(color=8)),
          Line(points=[-64, -44; -64, -44], style(color=8)),
          Line(points=[18, -48; 18, -48], style(color=8)),
          Line(points=[50, -50; 50, -50], style(color=8)),
          Ellipse(extent=[-5,131; -3,129], style(
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1)),
          Ellipse(extent=[-71,131; -69,129],   style(color=81, fillColor=81)),
          Ellipse(extent=[69,131; 71,129],   style(color=81, fillColor=81)),
          Ellipse(extent=[-63,-109; -61,-111], style(
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1)),
          Ellipse(extent=[99,-129; 101,-131], style(
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1))),
        Icon(
          Text(
            extent=[-86,112; 87,-118],
            style(color=41),
            string="FVF"),
          Text(extent=[-74,88; 66,48],   string="%name"),
          Line(points=[-70,-50; 68,-50],   style(color=41)),
          Line(points=[42,-44; 68,-50; 42,-56],    style(color=41))),
        Window(
          x=0.02,
          y=0,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This element models general forced volume flow through a pipe segment.  The inductance of the pipe segment is replaced by an external bond connector through which the enforced flow is determined. <p>

The top segment of the model represents volume flow.  The flow is measured, and an accompanying mass flow is introduced in the mass flow part of the model (the bottom segment of the model).  An accompanying entropy flow is also introduced in the heat flow part of the model (the center segment). <p>

Also modeled is the friction of the fluid in the pipe.  The generated entropy is sent downstream. <p>

Finally in order to enforce an equivalent mass flow, additional energy is needed.  This energy is taken from the thermal side by reducing the entropy upstream.
</html>"));
      BondLib.Bonds.fBond B1 annotation (extent=[-30, 60; -10, 80]);
      BondLib.Junctions.J1p3 J1p3_1 annotation (extent=[30,-100; 50,-80],
          rotation=-180);
      BondLib.Bonds.eBond B2 annotation (extent=[10, 60; 30, 80]);
      Junctions.J0p13 J0p13_1 annotation (extent=[-90, -60; -70, -40]);
      Junctions.J0p13 J0p13_2 annotation (extent=[90, -60; 70, -40]);
      Sensors.fDs State1 annotation (extent=[-110, -50; -90, -30], rotation=270);
      Sensors.eDs State2 annotation (extent=[90, -50; 110, -30], rotation=90);
      BondLib.Sensors.Df Df1 annotation (extent=[-14,100; 6,120],    rotation=90);
      BondLib.Bonds.eBond B3 annotation (extent=[-14,80; 6,100],    rotation=
            90);
      BondLib.Bonds.eBond B27
                             annotation (extent=[30, -40; 50, -20], rotation=
            -90);
      BondLib.Bonds.fBond B6 annotation (extent=[-70, -60; -50, -40]);
      BondLib.Bonds.eBond B9  annotation (extent=[50, -60; 70, -40]);
      BondLib.Bonds.fBond B7 annotation (extent=[-30, -60; -10, -40]);
      BondLib.Sources.mSf2 mSf2_1 annotation (extent=[-10, -60; 10, -40]);
      BondLib.Bonds.eBond B8 annotation (extent=[10, -60; 30, -40]);
      BondLib.Bonds.eBond B26 annotation (extent=[30, 0; 50, 20], rotation=-90);
      BondLib.Bonds.fBond B15 annotation (extent=[30,-80; 50,-60],
          rotation=270);
      BondLib.Bonds.fBond B18 annotation (extent=[10,-120; 30,-100],
          rotation=270);
      BondLib.Bonds.fBond B12 annotation (extent=[-50,-80; -30,-60],
          rotation=270);
      BondLib.Bonds.eBond B23 annotation (extent=[-50, -40; -30, -20],
          rotation=270);
      BondLib.Junctions.J1p3 J1p3_2 annotation (extent=[30, 20; 50, 40]);
      BondLib.Bonds.fBond B10 annotation (extent=[-10,-180; 10,-160]);
      BondLib.Bonds.eBond B22 annotation (extent=[-50, 0; -30, 20], rotation=
            270);
      Modelica.Blocks.Logical.Switch Switch1[3]            annotation (extent=
            [-60, 80; -80, 100], rotation=-90);
      Modelica.Blocks.Logical.GreaterEqualThreshold GreaterEqual0
                                                                annotation (
          extent=[-40, 140; -20, 120], rotation=180);
      BondLib.Bonds.Bond B16 annotation (extent=[50, -100; 70, -80]);
      BondLib.Thermal.RS RS1(R=R) annotation (extent=[30, -20; 50, 0],
          rotation=270);
      BondLib.Bonds.Bond B14 annotation (extent=[-30,-90; -10,-70]);
      BondLib.Switches.Sw Sw1 annotation (extent=[70, -100; 90, -80]);
      BondLib.Bonds.Bond B17 annotation (extent=[10,-90; 30,-70],    rotation=
            180);
      BondLib.Junctions.J1p3 J1p3_3 annotation (extent=[-50,-100; -30,-80],
          rotation=-180);
      BondLib.Thermal.RS RS2(R=R) annotation (extent=[-50, -20; -30, 0],
          rotation=-90);
      BondLib.Bonds.Bond B13 annotation (extent=[-70, -100; -50, -80],
          rotation=180);
      BondLib.Switches.Sw Sw2 annotation (extent=[-70, -100; -90, -80]);
      BondLib.Bonds.eBond B19 annotation (extent=[10,-160; 30,-140],
          rotation=-90);
      BondLib.Junctions.J1p3 J1p3_4 annotation (extent=[10,-160; 30,-180]);
      BondLib.Bonds.eBond B11 annotation (extent=[30,-180; 50,-160]);
      Modelica.Blocks.Logical.LessThreshold LessThan0     annotation (extent=[
            20, 120; 40, 140]);
      SV SV1(eps_v=MinVolFlow)
             annotation (extent=[-72, -120; -52, -140]);
      MV MV1(eps_v=MinVolFlow)
             annotation (extent=[72, -120; 52, -140]);
      Junctions.J0p2 J0p2_1 annotation (extent=[-110, -30; -90, -10], rotation=
           90);
      Junctions.J0p2 J0p2_2 annotation (extent=[90, -30; 110, -10], rotation=
            90);
      BondLib.Junctions.J0p3 J0p3_6 annotation (extent=[-10,-90; 10,-70]);
      BondLib.Bonds.Bond B24 annotation (extent=[10, 20; 30, 40]);
      BondLib.Bonds.Bond B20 annotation (extent=[-30, 20; -10, 40], rotation=
            180);
      BondLib.Bonds.Bond B25 annotation (extent=[50, 20; 70, 40]);
      BondLib.Switches.Sw Sw3 annotation (extent=[70, 20; 90, 40]);
      BondLib.Junctions.J1p3 J1p3_5 annotation (extent=[-50, 20; -30, 40]);
      BondLib.Bonds.Bond B21 annotation (extent=[-70, 20; -50, 40], rotation=
            180);
      BondLib.Switches.Sw Sw4 annotation (extent=[-70, 20; -90, 40]);
      BondLib.Bonds.eBond B4  annotation (extent=[-10,40; 10,60], rotation=-90);
      BondLib.Junctions.J0p3 J0p3_1 annotation (extent=[-10,40; 10,20]);
      BondLib.Junctions.J1p5 j1p5_1 annotation (extent=[-10,80; 10,60]);
      BondLib.Junctions.J0p4 j0p4_1 annotation (extent=[-50,-60; -30,-40]);
      BondLib.Junctions.J0p4 j0p4_2 annotation (extent=[30,-60; 50,-40]);
      BondLib.Sources.mSf3 mSf3_1
        annotation (extent=[30,-140; 10,-120],  rotation=-90);
      BondLib.Bonds.eBond B5 annotation (extent=[10,80; 30,100], rotation=180);
      BondLib.Junctions.J0p2 j0p2_1 annotation (extent=[30,80; 50,100]);
      BondLib.Interfaces.BondCon BondCon1 "Forcing flow bond connector"
                                          annotation (extent=[-10,-110; 10,-90]);
    equation
      connect(B3.eBondCon1, Df1.BondCon1) annotation (points=[-4,100; -4,100],
                  style(color=8));
      connect(State1.fThBondCon1, J0p13_1.ThBondCon1) annotation (points=[-100,
              -50; -90, -50], style(color=8));
      connect(J0p13_1.BondCon1,B6. eBondCon1) annotation (points=[-70, -50;
            -70, -50], style(color=8));
      connect(B9.eBondCon1, J0p13_2.BondCon1)  annotation (points=[70, -50; 70,
              -50], style(color=8));
      connect(J0p13_2.ThBondCon1, State2.fThBondCon1) annotation (points=[90,
            -50; 100, -50], style(color=8));
      connect(B19.eBondCon1, J1p3_4.BondCon3) annotation (points=[20,-160; 20,
            -160], style(color=8));
      connect(B10.fBondCon1, J1p3_4.BondCon1) annotation (points=[10,-170; 10,
            -170],      style(color=8));
      connect(J1p3_4.BondCon2,B11. fBondCon1) annotation (points=[30,-170; 30,
            -170],   style(color=8));
      connect(State1.eThBondCon1, J0p2_1.ThBondCon1) annotation (points=[-100,
              -30; -100, -30], style(color=8));
      connect(State2.eThBondCon1, J0p2_2.ThBondCon1) annotation (points=[100,
            -30; 100, -30], style(color=8));
      connect(J0p2_1.ThBondCon2, ThBondCon1) annotation (points=[-100,-10; -100,
            0],        style(color=8));
      connect(J0p2_2.ThBondCon2, ThBondCon2) annotation (points=[100,-10; 100,0],
                   style(color=8));
      connect(J0p3_6.BondCon3,B18. eBondCon1) annotation (points=[0,-90; 20,-90;
            20,-100],
                   style(color=8));
      connect(B17.BondCon2, J0p3_6.BondCon2) annotation (points=[10,-80; 10,-80],
                  style(color=8));
      connect(J1p3_1.BondCon2, B17.BondCon1) annotation (points=[30,-90; 30,-80;
            29.8,-80],
                  style(color=8));
      connect(J1p3_1.BondCon1, B16.BondCon1) annotation (points=[50, -90; 50.2,
              -90], style(color=8));
      connect(B16.BondCon2, Sw1.BondCon1) annotation (points=[70, -90; 70, -90],
               style(color=8));
      connect(B14.BondCon2, J0p3_6.BondCon1) annotation (points=[-10,-80; -10,
            -80],   style(color=8));
      connect(J1p3_3.BondCon1,B14. BondCon1) annotation (points=[-30,-90; -30,
            -80; -29.8,-80],
                    style(color=8));
      connect(B13.BondCon1, J1p3_3.BondCon2) annotation (points=[-50.2,-90; -50,
            -90],      style(color=8));
      connect(B13.BondCon2, Sw2.BondCon1) annotation (points=[-70, -90; -70,
            -90], style(color=8));
      connect(B7.fBondCon1, mSf2_1.BondCon1) annotation (points=[-10, -50; -10,
              -50], style(color=8));
      connect(mSf2_1.BondCon2,B8. fBondCon1) annotation (points=[10, -50; 10,
            -50], style(color=8));
      connect(B24.BondCon2, J1p3_2.BondCon1) annotation (points=[30, 30; 30,
            30], style(color=8));
      connect(J1p3_2.BondCon2,B25. BondCon1) annotation (points=[50, 30; 50.2,
              30], style(color=8));
      connect(B25.BondCon2, Sw3.BondCon1) annotation (points=[70, 30; 70, 30],
            style(color=8));
      connect(B20.BondCon2, J1p3_5.BondCon2) annotation (points=[-30, 30; -30,
              30], style(color=8));
      connect(J1p3_5.BondCon1,B21. BondCon1) annotation (points=[-50, 30;
            -50.2, 30], style(color=8));
      connect(B21.BondCon2, Sw4.BondCon1) annotation (points=[-70, 30; -70, 30],
               style(color=8));
      connect(J1p3_2.BondCon3, B26.fBondCon1) annotation (points=[40, 20; 40,
            20], style(color=8));
      connect(B26.eBondCon1, RS1.BondCon1) annotation (points=[40, 0; 40, 0],
          style(color=8));
      connect(RS1.BondCon2, B27.fBondCon1)
                                          annotation (points=[40, -20; 40, -20],
               style(color=8));
      connect(J1p3_5.BondCon3, B22.fBondCon1) annotation (points=[-40, 20; -40,
              20], style(color=8));
      connect(B22.eBondCon1, RS2.BondCon1) annotation (points=[-40, 0; -40, 0],
            style(color=8));
      connect(RS2.BondCon2,B23. fBondCon1) annotation (points=[-40, -20; -40,
            -20], style(color=8));
      connect(Sw4.BooleanInPort1,GreaterEqual0.y)       annotation (points=[-89,
            30; -100,30; -100,130; -41,130],         style(color=5));
      connect(Sw3.BooleanInPort1,LessThan0.y)        annotation (points=[89,30;
            100,30; 100,130; 41,130],        style(color=5));
      connect(GreaterEqual0.y,       Sw1.BooleanInPort1)
                                                        annotation (points=[-41,
            130; -70,130; -70,164; 134,164; 134,-90; 89,-90],           style(
            color=5));
      connect(J0p13_1.BondCon2, B1.eBondCon1) annotation (points=[-80, -40;
            -80, 0; -60, 0; -60, 70; -30, 70], style(color=8));
      connect(B2.eBondCon1, J0p13_2.BondCon2) annotation (points=[30, 70; 60,
            70; 60, 0; 80, 0; 80, -40], style(color=8));
      connect(LessThan0.y,       Sw2.BooleanInPort1) annotation (points=[41,130;
            70,130; 70,170; -134,170; -134,-90; -89,-90],           style(color=
             5));
      connect(Switch1.y,       SV1.InPort1) annotation (points=[-70,79; -70,60;
            -126,60; -126,-110; -62,-110; -62,-121],         style(color=3));
      connect(GreaterEqual0.y, Switch1[1].u2)
                                             annotation (points=[-41,130; -70,
            130; -70,102], style(color=5, rgbcolor={255,0,255}));
      connect(GreaterEqual0.y, Switch1[2].u2)
                                             annotation (points=[-41,130; -70,
            130; -70,102], style(color=5, rgbcolor={255,0,255}));
      connect(GreaterEqual0.y, Switch1[3].u2)
                                             annotation (points=[-41,130; -70,
            130; -70,102], style(color=5, rgbcolor={255,0,255}));
      connect(B20.BondCon1, J0p3_1.BondCon1) annotation (points=[-10.2,30; -10,
            30], style(color=8, rgbcolor={192,192,192}));
      connect(B24.BondCon1, J0p3_1.BondCon2) annotation (points=[10.2,30; 10,30],
          style(color=8, rgbcolor={192,192,192}));
      connect(J0p3_1.BondCon3, B4.eBondCon1) annotation (points=[0,40;
            6.12323e-016,40], style(color=8, rgbcolor={192,192,192}));
      connect(B1.fBondCon1, j1p5_1.BondCon1) annotation (points=[-10,70; -10,70],
          style(color=8, rgbcolor={192,192,192}));
      connect(j1p5_1.BondCon2, B2.fBondCon1) annotation (points=[10,70; 10,70],
          style(color=8, rgbcolor={192,192,192}));
      connect(B4.fBondCon1, j1p5_1.BondCon5) annotation (points=[-6.12323e-016,
            60; 0,60], style(color=8, rgbcolor={192,192,192}));
      connect(B3.fBondCon1, j1p5_1.BondCon3) annotation (points=[-4,80; -4,80],
          style(color=8, rgbcolor={192,192,192}));
      connect(SV1.y, mSf2_1.s) annotation (points=[-51,-130; -20,-130; -20,-70;
            0,-70; 0,-59], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=74,
          rgbfillColor={0,0,218},
          fillPattern=1));
      connect(MV1.InPort1, Switch1.y) annotation (points=[62,-121; 62,-110;
            -126,-110; -126,60; -70,60; -70,79], style(
          color=74,
          rgbcolor={0,0,127},
          fillColor=74,
          rgbfillColor={0,0,218},
          fillPattern=1));
      connect(j0p4_1.BondCon1, B6.fBondCon1) annotation (points=[-50,-50; -50,-50],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_1.BondCon4, B23.eBondCon1) annotation (points=[-40,-40; -40,
            -40], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_1.BondCon2, B7.eBondCon1) annotation (points=[-30,-50; -30,-50],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon1, B8.eBondCon1) annotation (points=[30,-50; 30,-50],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon4, B27.eBondCon1) annotation (points=[40,-40; 40,-40],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon2, B9.fBondCon1) annotation (points=[50,-50; 50,-50],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B12.eBondCon1, j0p4_1.BondCon3) annotation (points=[-40,-60; -40,
            -60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B12.fBondCon1, J1p3_3.BondCon3) annotation (points=[-40,-80; -40,
            -80], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(J1p3_1.BondCon3, B15.fBondCon1) annotation (points=[40,-80; 40,-80],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p4_2.BondCon3, B15.eBondCon1) annotation (points=[40,-60; 40,-60],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B10.eBondCon1, J0p13_1.BondCon3) annotation (points=[-10,-170;
            -94,-170; -94,-70; -80,-70; -80,-60],
                                              style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B11.eBondCon1, J0p13_2.BondCon3) annotation (points=[50,-170; 94,
            -170; 94,-70; 80,-70; 80,-60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(SV1.u, MV1.u) annotation (points=[-74,-130; -100,-130; -100,-190;
            100,-190; 100,-130; 74,-130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Df1.OutPort1, GreaterEqual0.u)
                                            annotation (points=[-4,121; -4,130;
            -18,130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Df1.OutPort1, LessThan0.u) annotation (points=[-4,121; -4,130; 18,
            130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Df1.OutPort1, MV1.u) annotation (points=[-4,121; -4,148; 126,148;
            126,-130; 74,-130], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(State2.OutPort1, Switch1.u3) annotation (points=[111,-40; 118,-40;
            118,156; -62,156; -62,102], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(State1.OutPort1, Switch1.u1) annotation (points=[-111,-40; -118,-40;
            -118,112; -78,112; -78,102], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(mSf3_1.BondCon1, B18.fBondCon1) annotation (points=[20,-120; 20,
            -120],                     style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(mSf3_1.BondCon2, B19.fBondCon1) annotation (points=[20,-140; 20,
            -140],                     style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(MV1.y, mSf3_1.s) annotation (points=[51,-130; 29,-130],style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(j1p5_1.BondCon4, B5.eBondCon1) annotation (points=[4,80; 4,90; 10,
            90], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(j0p2_1.BondCon1, B5.fBondCon1) annotation (points=[30,90; 30,90],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
      connect(j0p2_1.BondCon2, BondCon1) annotation (points=[50,90; 142,90; 142,
            -150; 0,-150; 0,-100], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=74,
          rgbfillColor={0,0,127},
          fillPattern=1));
    end FVF;

    package Utilities
      "Utility models used by the passive thermo-bond graph elements"

      annotation (Icon(
          Rectangle(extent=[-100,-100; 80,50],   style(fillColor=30,
                fillPattern=
                 1)),
          Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50],      style(
                fillColor=30, fillPattern=1)),
          Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70],      style(
                fillColor=30, fillPattern=1)),
          Text(
            extent=[-85,35; 65,-85],
            string="Library",
            style(color=3)),
          Text(
            extent=[-120,116; 120,67],
            string="%name",
            style(color=1))));
      model mGS2 "Conditional modulated conductive source element"
        extends BondLib.Interfaces.TwoPort;
        parameter Real G=1 "Bondgraphic Conductance";
        annotation (Diagram(
                  Text(
              extent=[-72,80; 76,-80],
              string="mGS",
              style(color=0))), Icon(
                  Text(
              extent=[-72,80; 76,-80],
              string="mGS",
              style(color=0)),
            Text(extent=[-84,-54; 74,-94],   string="G=%G"),
            Text(extent=[-70,80; 70,40],   string="%name")),
          Documentation(info="<html>
The conditional bondgraphic linear conductive source is a directed TwoPort element.  It inherits the effort and flow variables from the directed TwoPort.  The conductance is modeled as a parameter. A Boolean input signal determines, whether the conductive source element is in its \"on\" or in its \"off\" state.  When it is in its \"off\" state, the flow is interrupted. Hence the element operates like a series connection of a regular <b>GS</b> element and a switch. <p>

The linear conductive source element is to be used as a replacement for conductors in modeling the thermal behavior of non-thermal systems.  The primary side of the linear conductive source element is assumed to not be in the thermal domain. <p>

The conductive source element has free causality on the primary side, and fixed causality on the secondary side.  The causality stroke is at the element on the secondary side (a source of entropy, rather than a source of temperature). <p>

<hr>

<pre>
Potential variables:

 e1:  Bondgraphic effort variable of inflow

 f1:  Bondgraphic flow variable of inflow, normalized positive for flows into the model

 e2:  Bondgraphic effort variable of outflow

 f2:  Bondgraphic flow variable of outflow, normalized positive for flows out of the model

 u:   Boolean input signal


Parameters:

 G:   Conductance (default value = 1)
</pre> <p>

<hr> <p>

Equations: <p>

<b>f1 = if u then G*e1 else 0</b> <br>
<b>f2 = f1*(e1/e2)</b>
</html>"));
        Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal"
          annotation (extent=[-10,80; 10,100], rotation=-90);
      equation
        f1 = if u then G*e1 else 0;
        e1*f1 = e2*f2;
      end mGS2;

      model mGSth2 "Conditional modulated conductive thermal source element"
        extends BondLib.Interfaces.ModTwoPort(s(redeclare type SignalType =
                Modelica.SIunits.ThermalConductance));
        Modelica.SIunits.ThermalConductance lambda "Thermal conductance";
        Real G(unit="W/K2") "Bondgraphic thermal conductance";
        annotation (Diagram(
            Text(
              extent=[-74,80; 46,-82],
              string="mGS",
              style(color=0)),
            Text(
              extent=[-20,-56; 20,-72],
              string="lambda",
              style(color=0)),
            Text(
              extent=[46,28; 76,-56],
              string="th",
              style(color=0))), Icon(
            Text(
              extent=[-74,80; 46,-82],
              string="mGS",
              style(color=0)),
            Text(
              extent=[46,28; 76,-56],
              string="th",
              style(color=0)),
            Text(extent=[-70,80; 70,40],   string="%name"),
            Text(
              extent=[-28,-60; 30,-78],
              string="lambda",
              style(color=0))),
          Documentation(info="<html>
The bondgraphic conditional modulated conductive source is a directed modulated TwoPort element.  It inherits the effort and flow variables from the directed modulated TwoPort.  The thermal conductance is modeled as a real-valued variable. A Boolean input signal determines, whether the conductive source element is in its \"on\" or in its \"off\" state.  When it is in its \"off\" state, the flow is interrupted. Hence the element operates like a series connection of a regular <b>mGSth</b> element and a switch. <p>

The conductance, <b>G</b>, is inverse proportional to the temperature at the inflow, <b>T1</b>.  Since <b>e1</b> represents the temperature difference, <b>e1 = T1 - T2</b>, and since <b>e2</b> represents the temperature at the outflow, <b>e2 = T2</b>, the temperature at the inflow can be computed as: <b>T1 = e1 + e2</b>. <p>

The modulated conductive source element is to be used in conduction of thermal systems.  The primary side of the modulated conductive source element is assumed to be in the thermal domain. <p>

The conductive source element has free causality on the primary side, and fixed causality on the secondary side.  The causality stroke is at the element on the secondary side (a source of entropy, rather than a source of temperature). <p>

<hr>

<pre>
Potential variables:

 e1:     Bondgraphic effort variable of inflow

 f1:     Bondgraphic flow variable of inflow, normalized positive for flows into the model

 e2:     Bondgraphic effort variable of outflow

 f2:     Bondgraphic flow variable of outflow, normalized positive for flows out of the model

 G:      Bondgraphic thermal conductance

 lambda: Thermal conductance constant (modulation input signal)

 u:      Boolean input signal

</pre> <p>

<hr> <p>

Equations: <p>

<b>G = lambda/(e1+e2)</b> <br>
<b>f1 = if u then G*e1 else 0</b> <br>
<b>f2 = f1*(e1/e2)</b>
</html>"));
        Modelica.Blocks.Interfaces.BooleanInput u "Boolean input signal"
          annotation (extent=[-10,80; 10,100], rotation=-90);
      equation
        lambda = s;
        G = lambda/(e1 + e2);
        f1 = if u then G*e1 else 0;
        e1*f1 = e2*f2;
      end mGSth2;
    end Utilities;
  end Passive;

  package Sensors "Sensors (detectors) of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 122; 120, 73],
          string="%name",
          style(color=1))),
      Window(
        x=0.45,
        y=0.01,
        width=0.44,
        height=0.65,
        library=1,
        autolayout=1),
      Documentation(info="<html>
The sensors (detectors) of the thermo-bond graph library have been realized as bonds with additional signal outputs.  Consequently, there are causal and a-causal versions of the sensor elements. <p>

This package contains three types of detectors: <p>

<ol>
<li> effort detectors (<b>De</b>), <br>
<li> flow detectors (<b>Df</b>), and <br>
<li> state detectors (<b>Ds</b>).
</ol> <p>
</html>"));
    model De "Non-directed effort sensor"
      extends Bonds.ThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[-64, 48; -16, -4],
            string="De",
            style(color=41)),
          Text(
            extent=[88, -78; 106, -98],
            string="p",
            style(color=0)),
          Text(
            extent=[-10, -78; 6, -98],
            string="T",
            style(color=0)),
          Text(
            extent=[-110, -78; -94, -98],
            string="g",
            style(color=0))),
        Diagram(
          Text(
            extent=[-108, -76; -94, -98],
            string="g",
            style(color=0)),
          Text(
            extent=[-10, -78; 6, -98],
            string="T",
            style(color=0)),
          Text(
            extent=[90, -76; 106, -98],
            string="p",
            style(color=0))),
        Documentation(info="<html>
The non-directed effort sensor is built as an acausal thermo-bond with three additional output signals, through which it transmits the three effort values.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1(redeclare type SignalType
          = Modelica.SIunits.Temperature) "Temperature"
                                                  annotation (
        extent=[-10, -120; 10, -100],
        rotation=-90,
        layer="icon");
      Modelica.Blocks.Interfaces.RealOutput OutPort2(redeclare type SignalType
          = Modelica.SIunits.Pressure) "Pressure" annotation (
        extent=[90, -120; 110, -100],
        rotation=-90,
        layer="icon");
      Modelica.Blocks.Interfaces.RealOutput OutPort3(redeclare type SignalType
          = Modelica.SIunits.SpecificEnthalpy) "Gibbs potential"
                                                  annotation (
        extent=[-110, -120; -90, -100],
        rotation=-90,
        layer="icon");
    equation
      OutPort1 = ThBondCon1.T;
      OutPort2 = ThBondCon1.p;
      OutPort3 = ThBondCon1.g;
    end De;

    block eDe "Directed effort sensor"
      extends Bonds.eThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-110, -78; -94, -98],
            string="g",
            style(color=0)),
          Text(
            extent=[-10, -78; 6, -98],
            string="T",
            style(color=0)),
          Text(
            extent=[90, -78; 106, -98],
            string="p",
            style(color=0))),
        Icon(
          Text(
            extent=[-110, -78; -94, -98],
            string="g",
            style(color=0)),
          Text(
            extent=[-8, -78; 6, -98],
            string="T",
            style(color=0)),
          Text(
            extent=[90, -78; 106, -98],
            string="p",
            style(color=0)),
          Text(
            extent=[-64, 48; -16, -4],
            string="De",
            style(color=41))),
        Documentation(info="<html>
The directed effort sensor is built as a causal thermo-bond with three additional output signals, through which it transmits the three effort values.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1(redeclare type SignalType
          = Modelica.SIunits.Temperature) "Temperature"
                                                  annotation (extent=[-10, -
            120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort2(redeclare type SignalType
          = Modelica.SIunits.Pressure) "Pressure" annotation (extent=[90, -120;
              110, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort3(redeclare type SignalType
          = Modelica.SIunits.SpecificEnthalpy) "Gibbs potential"
                                                  annotation (extent=[-110, -
            120; -90, -100], rotation=-90);
    equation
      OutPort1 = eThBondCon1.T;
      OutPort2 = eThBondCon1.p;
      OutPort3 = eThBondCon1.g;
    end eDe;

    block fDe "Directed effort sensor"
      extends Bonds.fThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-110, -80; -94, -98],
            string="g",
            style(color=0)),
          Text(
            extent=[-10, -78; 6, -98],
            string="T",
            style(color=0)),
          Text(
            extent=[90, -80; 106, -98],
            string="p",
            style(color=0))),
        Icon(
          Text(
            extent=[-108, -78; -94, -98],
            string="g",
            style(color=0)),
          Text(
            extent=[-10, -78; 6, -98],
            string="T",
            style(color=0)),
          Text(
            extent=[92, -80; 106, -98],
            string="p",
            style(color=0)),
          Text(
            extent=[-64, 48; -16, -4],
            string="De",
            style(color=41))),
        Documentation(info="<html>
The directed effort sensor is built as a causal thermo-bond with three additional output signals, through which it transmits the three effort values.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1(redeclare type SignalType
          = Modelica.SIunits.Temperature) "Temperature"
                                                  annotation (extent=[-10, -
            120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort2(redeclare type SignalType
          = Modelica.SIunits.Pressure) "Pressure" annotation (extent=[90, -120;
              110, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort3(redeclare type SignalType
          = Modelica.SIunits.SpecificEnthalpy) "Gibbs potential"
                                                  annotation (extent=[-110, -
            120; -90, -100], rotation=-90);
    equation
      OutPort1 = eThBondCon1.T;
      OutPort2 = eThBondCon1.p;
      OutPort3 = eThBondCon1.g;
    end fDe;

    model Df "Non-directed flow sensor"
      extends Bonds.ThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-118, -72; -84, -102],
            string="Mdot",
            style(color=0)),
          Text(
            extent=[-22, -78; 22, -98],
            string="Sdot",
            style(color=0)),
          Text(
            extent=[90, -74; 106, -96],
            string="q",
            style(color=0))),
        Icon(
          Text(
            extent=[-122, -66; -78, -106],
            string="Mdot",
            style(color=0)),
          Text(
            extent=[-24, -76; 22, -100],
            string="Sdot",
            style(color=0)),
          Text(
            extent=[90, -74; 106, -96],
            string="q",
            style(color=0)),
          Text(
            extent=[-64, 48; -16, -4],
            string="Df",
            style(color=41))),
        Documentation(info="<html>
The non-directed flow sensor is built as an acausal thermo-bond with three additional output signals, through which it transmits the three flow values.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1(redeclare type SignalType
          = Modelica.SIunits.ThermalConductance) "Entropy flow"
                                                  annotation (extent=[-10, -
            120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort2(redeclare type SignalType
          = Modelica.SIunits.VolumeFlowRate) "Volume flow"
                                                  annotation (extent=[90, -120;
              110, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort3(redeclare type SignalType
          = Modelica.SIunits.MassFlowRate) "Mass flow"
                                                  annotation (extent=[-110, -
            120; -90, -100], rotation=-90);
    equation
      OutPort1 = ThBondCon1.Sdot;
      OutPort2 = ThBondCon1.q;
      OutPort3 = ThBondCon1.Mdot;
    end Df;

    block eDf "Directed flow sensor"
      extends Bonds.eThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-122, -72; -84, -102],
            string="Mdot",
            style(color=0)),
          Text(
            extent=[-22, -78; 22, -98],
            string="Sdot",
            style(color=0)),
          Text(
            extent=[90, -74; 106, -96],
            string="q",
            style(color=0))),
        Icon(
          Text(
            extent=[-122, -68; -76, -102],
            string="Mdot",
            style(color=0)),
          Text(
            extent=[-22, -78; 22, -98],
            string="Sdot",
            style(color=0)),
          Text(
            extent=[90, -74; 106, -96],
            string="q",
            style(color=0)),
          Text(
            extent=[-64, 48; -16, -4],
            string="Df",
            style(color=41))),
        Documentation(info="<html>
The directed flow sensor is built as a causal thermo-bond with three additional output signals, through which it transmits the three flow values.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1(redeclare type SignalType
          = Modelica.SIunits.ThermalConductance) "Entropy flow"
                                                  annotation (extent=[-10, -
            120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort2(redeclare type SignalType
          = Modelica.SIunits.VolumeFlowRate) "Volume flow"
                                                  annotation (extent=[90, -120;
              110, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort3(redeclare type SignalType
          = Modelica.SIunits.MassFlowRate) "Mass flow"
                                                  annotation (extent=[-110, -
            120; -90, -100], rotation=-90);
    equation
      OutPort1 = fThBondCon1.Sdot;
      OutPort2 = fThBondCon1.q;
      OutPort3 = fThBondCon1.Mdot;
    end eDf;

    block fDf "Directed flow sensor"
      extends Bonds.fThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-122, -72; -84, -102],
            string="Mdot",
            style(color=0)),
          Text(
            extent=[-22, -78; 22, -98],
            string="Sdot",
            style(color=0)),
          Text(
            extent=[90, -74; 106, -96],
            string="q",
            style(color=0))),
        Icon(
          Text(
            extent=[-124, -70; -78, -104],
            string="Mdot",
            style(color=0)),
          Text(
            extent=[-26, -74; 22, -98],
            string="Sdot",
            style(color=0)),
          Text(
            extent=[88, -72; 106, -96],
            string="q",
            style(color=0)),
          Text(
            extent=[-64, 48; -16, -4],
            string="Df",
            style(color=41))),
        Documentation(info="<html>
The directed flow sensor is built as a causal thermo-bond with three additional output signals, through which it transmits the three flow values.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1(redeclare type SignalType
          = Modelica.SIunits.ThermalConductance) "Entropy flow"
                                                  annotation (extent=[-10, -
            120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort2(redeclare type SignalType
          = Modelica.SIunits.VolumeFlowRate) "Volume flow"
                                                  annotation (extent=[90, -120;
              110, -100], rotation=-90);
      Modelica.Blocks.Interfaces.RealOutput OutPort3(redeclare type SignalType
          = Modelica.SIunits.MassFlowRate) "Mass flow"
                                                  annotation (extent=[-110, -
            120; -90, -100], rotation=-90);
    equation
      OutPort1 = fThBondCon1.Sdot;
      OutPort2 = fThBondCon1.q;
      OutPort3 = fThBondCon1.Mdot;
    end fDf;

    model Ds "Non-directed state sensor"
      extends Bonds.ThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-28, -76; 26, -98],
            string="S,V,M",
            style(color=0))),
        Icon(Text(
            extent=[-64, 48; -16, -4],
            string="Ds",
            style(color=41)), Text(
            extent=[-28, -76; 26, -98],
            string="S,V,M",
            style(color=0))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
The non-directed state sensor is built as an acausal thermo-bond with an additional output signal vector, through which it transmits the three state values.  A Boolean output signal indicates, whether there is any substance or not.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1[3] "State vector"
                                                       annotation (extent=[-10,
              -120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.BooleanOutput BooleanOutPort1
        "Boolean output signal"                                 annotation (
          extent=[100, 90; 120, 110], layer="icon");
    equation
      OutPort1[1] = ThBondCon1.S;
      OutPort1[2] = ThBondCon1.V;
      OutPort1[3] = ThBondCon1.M;
      BooleanOutPort1 = ThBondCon1.Exist;
    end Ds;

    block eDs "Directed state sensor"
      extends Bonds.eThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-28, -76; 26, -98],
            string="S,V,M",
            style(color=0))),
        Icon(Text(
            extent=[-64, 48; -16, -4],
            string="Ds",
            style(color=41)), Text(
            extent=[-28, -76; 26, -98],
            string="S,V,M",
            style(color=0))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
The directed state sensor is built as a causal thermo-bond with an additional output signal vector, through which it transmits the three state values.  A Boolean output signal indicates, whether there is any substance or not.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1[3] "State vector"
                                                       annotation (extent=[-10,
              -120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.BooleanOutput BooleanOutPort1
        "Boolean output signal"                                 annotation (
          extent=[100, 90; 120, 110], layer="icon");
    equation
      OutPort1[1] = eThBondCon1.S;
      OutPort1[2] = eThBondCon1.V;
      OutPort1[3] = eThBondCon1.M;
      BooleanOutPort1 = eThBondCon1.Exist;
    end eDs;

    block fDs "Directed state sensor"
      extends Bonds.fThermoBond;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-28, -76; 26, -98],
            string="S,V,M",
            style(color=0))),
        Icon(Text(
            extent=[-64, 48; -16, -4],
            string="Ds",
            style(color=41)), Text(
            extent=[-28, -76; 26, -98],
            string="S,V,M",
            style(color=0))),
        Window(
          x=0.04,
          y=0.13,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
The directed state sensor is built as a causal thermo-bond with an additional output signal vector, through which it transmits the three state values.  A Boolean output signal indicates, whether there is any substance or not.
</html>"));
      Modelica.Blocks.Interfaces.RealOutput OutPort1[3] "State vector"
                                                       annotation (extent=[-10,
              -120; 10, -100], rotation=-90);
      Modelica.Blocks.Interfaces.BooleanOutput BooleanOutPort1
        "Boolean output signal"                                 annotation (
          extent=[100, 90; 120, 110]);
    equation
      OutPort1[1] = eThBondCon1.S;
      OutPort1[2] = eThBondCon1.V;
      OutPort1[3] = eThBondCon1.M;
      BooleanOutPort1 = eThBondCon1.Exist;
    end fDs;
  end Sensors;

  package Sources "Sources of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 120; 120, 71],
          string="%name",
          style(color=1))),
      Window(
        x=0,
        y=0.6,
        width=0.4,
        height=0.4,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains a collection of different source elements.  Currently available are: <p>

<ol>
<li> a temperature source (<b>Se</b>) (no material flow), <br>
<li> a temperature source (<b>mSe</b>) (no material flow), <br>
<li> ambient air (<b>Se_Air</b>), and <br>
<li> a simplified modulated internal volume flow source (<b>mSf</b>).
</ol> <p>
</html>"));
    model Se "Temperature source"
      extends Interfaces.ActiveOnePort;
      parameter Modelica.SIunits.Temperature T0=298.0 "Source temperature";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Line(points=[-18, 4; -18, 4], style(color=8)),
          Text(
            extent=[-60, 80; 60, -80],
            style(color=41),
            string="Se"),
          Line(points=[-60, 0; -60, 0], style(color=8)),
          Line(points=[-40, 0; -40, 0], style(color=8)),
          Line(points=[-20, 0; -20, 0], style(color=8)),
          Line(points=[0, 0; 0, 0], style(color=8)),
          Line(points=[-40, 0; -40, 0], style(color=8)),
          Line(points=[-60, 0; -60, 0], style(color=8))),
        Icon(
          Text(
            extent=[-60, 80; 60, -80],
            style(color=41),
            string="Se"),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(extent=[-70, -50; 70, -90], string="T0=%T0")),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This <b>Se</b> element represents a pure temperature source.  The pressure and Gibbs potential of this source are assumed to be zero.  Since no material is imported through this source, it is unnecessary to consider the entropy of the source.
</html>"));
    equation
      T = T0;
      p = 0;
      g = 0;
      S = 0;
      V = 0;
      M = 0;
      Exist = true;
    end Se;

    model mSe "Modulated temperature source"
      extends Interfaces.ModActiveOnePort(InPort1(redeclare type SignalType =
              Modelica.SIunits.Temperature));
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(Text(
            extent=[-72, 80; 72, -80],
            string="mSe",
            style(color=41))),
        Icon(Text(extent=[-70, 90; 70, 50], string="%name"), Text(
            extent=[-72, 80; 72, -80],
            string="mSe",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This <b>mSe</b> element represents a pure temperature source.  The pressure and Gibbs potential of this source are assumed to be zero.  Since no material is imported through this source, it is unnecessary to consider the entropy of the source.  The temperature value is imported into the model as a modulating signal.
</html>"));
    equation
      T = s;
      p = 0;
      g = 0;
      S = 0;
      V = 0;
      M = 0;
      Exist = true;
    end mSe;

    model Se_Air "Ambient air source"
      extends Interfaces.ActiveOnePort;
      parameter Modelica.SIunits.Temperature T0 = 298.0
        "Ambient air temperature";
      parameter Modelica.SIunits.Pressure p0 = 1.02e5 "Ambient air pressure";
      parameter Modelica.SIunits.Entropy S0 = 6810.10184
        "Entropy of 1 kg of ambient air";
      parameter Modelica.SIunits.Volume V0 = 0.83112221
        "Volume of 1 kg of ambient air";
      parameter Modelica.SIunits.Mass M0 = 1 "Normalized mass";
      parameter Modelica.SIunits.SpecificHeatCapacity cp=1004.0
        "Heat capacity of air at constant pressure";
      Modelica.SIunits.SpecificEntropy s "Ambient air specific entropy";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Line(points=[-20,8; -20,8],   style(color=8)),
          Line(points=[-62,4; -62,4],   style(color=8)),
          Line(points=[-42,4; -42,4],   style(color=8)),
          Line(points=[-22,4; -22,4],   style(color=8)),
          Line(points=[-2,4; -2,4], style(color=8)),
          Line(points=[-42,4; -42,4],   style(color=8)),
          Line(points=[-62,4; -62,4],   style(color=8)),
                Text(
            extent=[40,2; 78,-46],
            string="air",
            style(color=41)), Text(
            extent=[-76,82; 40,-78],
            style(color=41),
            string="Se")),
        Icon(
          Text(
            extent=[-76,82; 40,-78],
            style(color=41),
            string="Se"),
          Text(
            extent=[40,2; 78,-46],
            string="air",
            style(color=41)),
          Text(extent=[-70,90; 70,50],   string="%name")),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This <b>Se</b> element models ambient air.  Ambient air could be viewed as an infinitely large capacitive air field.  Yet an infinitely large capacitor turns into an effort source. <p>

The state information is unimportant, as it never changes.  However, the relative proportions of mass, volume, and entropy are important, as the flow element may require either the specific volume, the specific entropy, or both.  For this reason, the mass has been normalized to 1, and the entropy and volume are specified accordingly.
</html>"));
    equation
      S = S0;
      V = V0;
      M = M0;
      s = S/M;
      T = T0;
      p = p0;
      g = T*(cp - s);
      Exist = true;
    end Se_Air;

    model mSf "Modulated (simplified) volume flow source"
      extends Interfaces.TwoPort;
      Modelica.SIunits.VolumeFlowRate q "Forced volume flow";
      Boolean sq "True if flow from primary to secondary side";
      Modelica.SIunits.Entropy Sref "Reference Entropy";
      Modelica.SIunits.Volume Vref "Reference Volume";
      Modelica.SIunits.Mass Mref "Reference Mass";
      Modelica.SIunits.Density rho "Density";
      Real s(unit="J/(K.m3)") "Specific entropy";
      Modelica.SIunits.Temperature Tref "Reference temperature";
      Modelica.SIunits.ThermalConductance Sdot
        "Entropy balance (can be negative)";
      Modelica.SIunits.Pressure Deltap "Pressure difference";
      Boolean Exist "True if there is a flow";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Text(
            extent=[-68, 78; 72, -80],
            string="mSf",
            style(color=41)),
          Line(points=[-66, -48; 72, -48], style(color=41)),
          Line(points=[46, -42; 72, -48; 46, -54], style(color=41))),
        Icon(
          Text(
            extent=[-68, 78; 72, -80],
            string="mSf",
            style(color=41)),
          Text(extent=[-68,84; 72,44],   string="%name"),
          Line(points=[-66, -48; 72, -48], style(color=41)),
          Line(points=[46, -42; 72, -48; 46, -54], style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This <b>mSf</b> element represents a simplified forced volume flow.  The desired volume flow is imported through a modulating signal.  The forced volume flow leads to an equivalent forced mass flow and an equivalent forced entropy flow.  The state information is taken from the upstream side.  Potential equilibration takes place in parallel.  Energy conservation is enforced by calculating the entropy flow resulting from potential equilibration. <p>

This model should only be used for small material flows, as it does not account for all phenomena that accompany convective flows.  The model is used within the <b>RFq</b> element, and indirectly also within the <b>RFV</b> element.
</html>"));
      Modelica.Blocks.Interfaces.RealInput InPort1(redeclare type SignalType =
            Modelica.SIunits.VolumeFlowRate) "Forced volume flow"
                                                annotation (
        extent=[-10, -100; 10, -80],
        rotation=90,
        layer="icon");
      BondLib.Interfaces.BondCon BondCon1 "Thermal bond graph connector"
                                          annotation (extent=[-10, 90; 10, 110],
               layer="icon");
    equation
      q = InPort1;
      q1 = q;
      q2 = q1;
      sq = q > 0;
      Sref = if sq then S1 else S2;
      Vref = if sq then V1 else V2;
      Mref = if sq then M1 else M2;
      rho = Mref/Vref;
      Mdot1 = rho*q;
      Mdot2 = Mdot1;
      s = Sref/Vref;
      Sdot1 = s*q;
      Sdot2 = Sdot1;
      Tref = BondCon1.e;
      Sdot = -BondCon1.d*BondCon1.f;
      Tref*Sdot = (T1 - T2)*Sdot1 - (p1 - p2)*q + (g1 - g2)*Mdot1;
      Deltap = p1 - p2;
      Exist = sq and Exist1 or not sq and Exist2;
    end mSf;

    model mSf2 "Modulated forced volume flow"
      extends Interfaces.ModActiveOnePort(InPort1(redeclare type SignalType =
              Modelica.SIunits.VolumeFlowRate));
      annotation (
        Diagram,
        Icon(
          Text(
            extent=[-74,78; 66,-80],
            string="mSf",
            style(color=41)),
          Text(extent=[-72,82; 68,42],   string="%name")),
        Documentation(info="<html>
This model represents a forced volume flow that takes its power out of the thermal domain. <p>

The model is being used in the context of storages operating under isochoric conditions.  Each volume flow into or out of the storage must be compensated by a corresponding volume flow of opposite direction that takes its power from the thermal domain.
</html>"));
      Junctions.J0p12 j0p12_1 annotation (extent=[-80,-10; -60,10]);
      BondLib.Sources.mSf3 mSf3_1
        annotation (extent=[-10,-10; 10,10], rotation=90);
      BondLib.Bonds.fBond B1 annotation (extent=[-10,-30; 10,-10], rotation=90);
      BondLib.Bonds.eBond B2 annotation (extent=[-10,10; 10,30], rotation=90);
    equation
      connect(j0p12_1.ThBondCon1, ThBondCon1) annotation (points=[-80,0; -100,0],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(mSf3_1.s, InPort1) annotation (points=[9,-5.51091e-016; 46.5,
            -5.51091e-016; 46.5,0; 90,0], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(mSf3_1.BondCon1, B1.fBondCon1) annotation (points=[-6.12323e-016,
            -10; 6.12323e-016,-10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B2.fBondCon1, mSf3_1.BondCon2) annotation (points=[-6.12323e-016,
            10; -6.12323e-016,15; 6.12323e-016,15; 6.12323e-016,10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p12_1.BondCon1, B1.eBondCon1) annotation (points=[-60,0; -40,0;
            -40,-40; -6.12323e-016,-40; -6.12323e-016,-30], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B2.eBondCon1, j0p12_1.BondCon2) annotation (points=[6.12323e-016,
            30; 0,30; 0,40; -70,40; -70,10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
    end mSf2;
  end Sources;

  package Tables "Tabular functions of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 120; 120, 71],
          string="%name",
          style(color=1))),
      Window(
        x=0,
        y=0.6,
        width=0.4,
        height=0.4,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains a number of table-lookup functions.  Convective flows operate frequently on steam tables.  These are being stored in this package.
</html>"));
    function Piecewise "1D linear table interpolation function"
      input Real x "Independent variable";
      input Real x_grid[:] "Independent variable data points";
      input Real y_grid[:] "Dependent variable data points";
      output Real y "Interpolated result";
    protected
      Integer n;
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Rectangle(extent=[-44, 60; -8, 40], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 40; -8, 20], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 20; -8, -2], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 0; -8, -22], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -20; -8, -42], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -40; -8, -60], style(color=0, fillColor=49)),
          Rectangle(extent=[-8, 60; 28, 40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 40; 28, 20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 20; 28, -2], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 0; 28, -20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -20; 28, -40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -40; 28, -60], style(color=0, fillColor=7)),
          Text(extent=[-96, 94; 98, 70], string="Linear interpolation")),
        Icon(
          Rectangle(extent=[-44, 60; -8, 40], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 40; -8, 20], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 20; -8, -2], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 0; -8, -22], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -20; -8, -42], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -40; -8, -60], style(color=0, fillColor=49)),
          Rectangle(extent=[-8, 60; 28, 40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 40; 28, 20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 20; 28, -2], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 0; 28, -20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -20; 28, -40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -40; 28, -60], style(color=0, fillColor=7)),
          Text(extent=[-150, 150; 150, 110], string="%name")),
        Documentation(info="<html>
1D linear interpolation function from the book by Michael Tiller. <p>

<b>References:</b> <p>

<ol>
<li> Tiller, M.M. (2001), <a href=\"http://www.amazon.com/Introduction-Physical-Modeling-International-Engineering/dp/0792373677\">Introduction to Physical Modeling with Modelica</a>, Springer-Verlag, New York, ISBN: 0-792-37367-7, 368p.
</ol>
</html>"));
    algorithm
      n := size(x_grid, 1);
      assert(size(x_grid, 1) == size(y_grid, 1), "Size mismatch");
      assert(x >= x_grid[1] and x <= x_grid[n], "Out of range");
      for i in 1:n - 1 loop
        if x >= x_grid[i] and x <= x_grid[i + 1] then
          y := y_grid[i] + (y_grid[i + 1] - y_grid[i])*((x - x_grid[i])/(
            x_grid[i + 1] - x_grid[i]));
        end if;
      end for;
    end Piecewise;

    block TableLookup
      "1D table lookup block invoking the Piecewise 1D linear table interpolation function"
      extends Modelica.Blocks.Interfaces.SISO;
      parameter Real x_vals[:]={0} "Independent variable data points";
      parameter Real y_vals[:]={0} "Dependent variable data points";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Diagram(
          Rectangle(extent=[-44, 60; -8, 40], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 40; -8, 20], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 20; -8, -2], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 0; -8, -22], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -20; -8, -42], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -40; -8, -60], style(color=0, fillColor=49)),
          Rectangle(extent=[-8, 60; 28, 40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 40; 28, 20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 20; 28, -2], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 0; 28, -20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -20; 28, -40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -40; 28, -60], style(color=0, fillColor=7)),
          Line(points=[-100, 0; -44, 0], style(color=9)),
          Line(points=[28, 0; 100, 0], style(color=9)),
          Text(
            extent=[-88, 20; -62, 2],
            string="u",
            style(color=9)),
          Text(
            extent=[52, 20; 78, 2],
            string="y",
            style(color=9))),
        Icon(
          Rectangle(extent=[-44, 60; -8, 40], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 40; -8, 20], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 20; -8, -2], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, 0; -8, -22], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -20; -8, -42], style(color=0, fillColor=49)),
          Rectangle(extent=[-44, -40; -8, -60], style(color=0, fillColor=49)),
          Rectangle(extent=[-8, 60; 28, 40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 40; 28, 20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 20; 28, -2], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, 0; 28, -20], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -20; 28, -40], style(color=0, fillColor=7)),
          Rectangle(extent=[-8, -40; 28, -60], style(color=0, fillColor=7))),
        Documentation(info="<html>
1D table lookup block invoking the <b>Piecewise</b> 1D linear table interpolation function by Michael Tiller. <p>

<b>References:</b> <p>

<ol>
<li> Tiller, M.M. (2001), <a href=\"http://www.amazon.com/Introduction-Physical-Modeling-International-Engineering/dp/0792373677\">Introduction to Physical Modeling with Modelica</a>, Springer-Verlag, New York, ISBN: 0-792-37367-7, 368p.
</ol>
</html>"));
    equation
      y = Piecewise(x=u, x_grid=x_vals, y_grid=y_vals);
    end TableLookup;

    block Kappa "Pressure/temperature dependence of water"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature), y(redeclare type SignalType = Real (
               unit="m.s2/kg")));
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(extent=[-80, 84; 84, 50], string="Pressure/volume"),
          Text(extent=[-72, 48; 70, 26], string="coefficient"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Diagram,
        Documentation(info="<html>
This block computes the dependence of water pressure as a function of temperature by table lookup. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,293.15,313.15,333.15,403.15},
          y_vals={50.2,46.0,44.0,44.0,47.7}) annotation (extent=[-60, -20; -20,
              20]);
      Modelica.Blocks.Math.Gain Gain1(k=1e-9)       annotation (extent=[0, -20;
              40, 20]);
    equation
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -64,0],
                    style(color=3));
      connect(TableLookup1.y,Gain1.u)             annotation (points=[-18,0; -4,
            0],     style(color=3));
      connect(Gain1.y,y)              annotation (points=[42,0; 110,0],
          style(color=3));
    end Kappa;

    block Alpha "heat capacity/temperature dependence of water"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature));
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(extent=[-84, 76; 88, 54], string="Temperature/volume"),
          Text(extent=[-72, 48; 70, 26], string="coefficient"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Diagram,
        Documentation(info="<html>
This block computes the dependence of the heat capacity of water as a function of temperature by table lookup. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,275.15,277.15,279.15,281.15,
            283.15,293.15,303.15,313.15,323.15,353.15,403.15}, y_vals={-0.132,-
            0.032,0.0,0.032,0.124,0.273,1.773,4.346,7.82,10.07,28.99,43.43})
        annotation (extent=[-80,-20; -40,20]);
      Modelica.Blocks.Math.Gain Gain1(k=0.001)   annotation (extent=[-20,-20;
            20,20]);
      Modelica.Blocks.Sources.Constant Constant1 annotation (extent=[-20, 40;
            20, 80]);
      Modelica.Blocks.Math.Add Add1 annotation (extent=[40, -20; 80, 20]);
    equation
      connect(TableLookup1.y,Gain1.u)             annotation (points=[-38,0;
            -24,0],       style(color=3));
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -84,0],
               style(color=3));
      connect(Add1.y,y)              annotation (points=[82,0; 110,0],   style(
           color=3));
      connect(Gain1.y,Add1.u2)             annotation (points=[22,0; 28,0; 28,
            -12; 36,-12],      style(color=3));
      connect(Constant1.y,Add1.u1)             annotation (points=[22,60; 28,60;
            28,12; 36,12],         style(color=3));
    end Alpha;

    block pSat "Saturation pressure of water"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature), y(redeclare type SignalType =
              Modelica.SIunits.Pressure));
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Text(extent=[-68, 80; 72, 54], string="Saturation"),
          Text(extent=[-72, 48; 70, 26], string="pressure"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Diagram,
        Documentation(info="<html>
This block computes the saturation vapor pressure of water. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,293.15,313.15,333.15,353.15,
            373.15,393.15,413.15,433.15,453.15,473.15,493.15,513.15,533.15,
            553.15,573.15,593.15,613.15,623.15,633.15,643.15,647.3}, y_vals={
            0.6107,2.337,7.374,19.92,47.36,101.32,198.53,361.4,618.0,1002.7,
            1555.1,2320.1,3348.0,4694,6419,8592.0,11290,14608,16537,18674,21052,
             22129}) annotation (extent=[-60, -20; -20, 20]);
      Modelica.Blocks.Math.Gain Gain1(k=1000) annotation (extent=[0, -20; 40,
            20]);
    equation
      connect(TableLookup1.y,Gain1.u)             annotation (points=[-18,0; -4,
            0],          style(color=3));
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -64,0],
               style(color=3));
      connect(Gain1.y,y)              annotation (points=[42,0; 110,0],
          style(color=3));
    end pSat;

    block VSat "Saturation volume of water"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature), y(redeclare type SignalType =
              Modelica.SIunits.SpecificVolume));
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Text(extent=[-68, 80; 72, 54], string="Saturation"),
          Text(extent=[-72, 48; 70, 26], string="volume"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Diagram,
        Documentation(info="<html>
This block computes the saturation volume of water in its liquid phase. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,293.15,313.15,333.15,353.15,
            373.15,393.15,413.15,433.15,453.15,473.15,493.15,513.15,533.15,
            553.15,573.15,593.15,613.15,623.15,633.15,643.15,647.3}, y_vals={
            1.0002,1.0017,1.0078,1.0172,1.0293,1.0438,1.0608,1.0802,1.1024,
            1.1278,1.1568,1.1903,1.2293,1.2757,1.3322,1.4033,1.98,1.638,1.746,
            1.908,2.23,3.18}) annotation (extent=[-60, -20; -20, 20]);
      Modelica.Blocks.Math.Gain Gain1(k=0.001)   annotation (extent=[0, -20;
            40, 20]);
    equation
      connect(TableLookup1.y,Gain1.u)             annotation (points=[-18,0; -4,
            0],          style(color=3));
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -64,0],
               style(color=3));
      connect(Gain1.y,y)              annotation (points=[42,0; 110,0],
          style(color=3));
    end VSat;

    block gCorr "Temperature dependence of Gibbs potential of water"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature), y(redeclare type SignalType =
              Modelica.SIunits.SpecificEnthalpy));
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Text(extent=[-68, 78; 72, 56], string="Correction of"),
          Text(extent=[-72, 48; 70, 26], string="Gibbs potential"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Diagram,
        Documentation(info="<html>
This block computes the dependence of the Gibbs potential of water as a function of temperature by table lookup. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,293.15,313.15,333.15,353.15,
            373.15,393.15,413.15,433.15,453.15,473.15}, y_vals={0.35805,
            0.556965,1.211975,2.99745,6.582585,12.293345,20.59671,31.828045,
            46.8474,66.802935,93.212865}) annotation (extent=[-60,-20; -20,20]);
      Modelica.Blocks.Math.Gain Gain1(k=1000) annotation (extent=[0,-20; 40,20]);
    equation
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -64,0],
                    style(color=3));
      connect(Gain1.y, y) annotation (points=[42,0; 110,0], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Gain1.u, TableLookup1.y) annotation (points=[-4,0; -18,0], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
    end gCorr;

    block VSat2 "Saturation volume of water vapor"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature), y(redeclare type SignalType =
              Modelica.SIunits.SpecificVolume));
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Text(extent=[-68, 80; 72, 54], string="Saturation"),
          Text(extent=[-72, 48; 70, 26], string="volume"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water vapor"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Diagram,
        Documentation(info="<html>
This block computes the saturation volume of water in its gaseous phase. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,293.15,313.15,333.15,353.15,
            373.15,393.15,413.15,433.15,453.15,473.15,493.15,513.15,533.15,
            553.15,573.15,593.15,613.15,623.15,633.15,643.15,647.3}, y_vals={
            206300,57840,19560,7685,3410,1673,891.3,508.4,306.8,193.9,127.3,
            86.11,59.67,42.09,30.05,21.6,15.49,10.77,8.803,6.967,4.99,3.18})
        annotation (extent=[-60, -20; -20, 20]);
      Modelica.Blocks.Math.Gain Gain1(k=0.001)   annotation (extent=[0, -20;
            40, 20]);
    equation
      connect(TableLookup1.y,Gain1.u)             annotation (points=[-18,0; -4,
            0],          style(color=3));
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -64,0],
               style(color=3));
      connect(Gain1.y,y)              annotation (points=[42,0; 110,0],
          style(color=3));
    end VSat2;

    block Hboil "Specific enthalpy of boiling of water"
      extends Modelica.Blocks.Interfaces.SISO(u(redeclare type SignalType =
              Modelica.SIunits.Temperature), y(redeclare type SignalType =
              Modelica.SIunits.SpecificEnthalpy));
      annotation (Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]), Icon(
          Text(extent=[-68, 80; 72, 54], string="Enthalpy"),
          Text(extent=[-72, 48; 70, 26], string="of boiling"),
          Text(extent=[-70, -8; 72, -30], string="as function of"),
          Text(extent=[-72, 18; 70, -4], string="of water"),
          Text(extent=[-70, -36; 72, -58], string="temperature")),
        Diagram,
        Documentation(info="<html>
This block computes the specific enthalpy of boiling of water as a function of temperature. <p>

<b>References:</b> <p>

<ol>
<li> Yaws, C.L. (1998), <a href=\"http://www.amazon.com/Chemical-Properties-Handbook-Thermodynamics-Engironmental/dp/0070734011\">Chemical Properties Handbook: Physical, Thermodynamics, Environmental Transport, Safety and Health Related Properties for Organic and Inorganic Chemicals</a>, McGraw-Hill, New York, ISBN: 0-07-073401-1, 784p.
</ol>
</html>"));
      TableLookup TableLookup1(x_vals={273.15,293.15,313.15,333.15,353.15,
            373.15,393.15,413.15,433.15,453.15,473.15,493.15,513.15,533.15,
            553.15,573.15,593.15,613.15,623.15,633.15,643.15,647.3}, y_vals={
            2500.5,2453.4,2406.2,2357.9,2307.8,2255.5,2200.7,2142.9,2081.3,
            2014.9,1941.9,1860.4,1768.2,1663.1,1542.5,1403.6,1241.3,1026.7,
            892.2,720.9,446.2,0.00}) annotation (extent=[-60,-20; -20,20]);
      Modelica.Blocks.Math.Gain Gain1(k=1000) annotation (extent=[0,-20; 40,20]);
    equation
      connect(u,TableLookup1.u)            annotation (points=[-120,0; -64,0],
                    style(color=3));
      connect(Gain1.u, TableLookup1.y) annotation (points=[-4,0; -18,0], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(Gain1.y, y) annotation (points=[42,0; 110,0], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
    end Hboil;
  end Tables;

  package Substances "Substances of Modelica thermo-bond graph library"

    annotation (
      preferedView="info",
      Icon(
        Rectangle(extent=[-100, -100; 80, 50], style(fillColor=30, fillPattern=
               1)),
        Polygon(points=[-100, 50; -80, 70; 100, 70; 80, 50; -100, 50], style(
              fillColor=30, fillPattern=1)),
        Polygon(points=[100, 70; 100, -80; 80, -100; 80, 50; 100, 70], style(
              fillColor=30, fillPattern=1)),
        Text(
          extent=[-85, 35; 65, -85],
          string="Library",
          style(color=3)),
        Text(
          extent=[-120, 120; 120, 71],
          string="%name",
          style(color=1))),
      Window(
        x=0,
        y=0.6,
        width=0.4,
        height=0.4,
        library=1,
        autolayout=1),
      Documentation(info="<html>
This package contains models representing fluid storages.  Currently available are only he most basic of these models, namely those representing: <p>

<ol>
<li>air, <br>
<li>liquid water, and <br>
<li>water vapor.
</ol>
</html>"));
    model BoilCondWater "Boiling and condensation of water"
      extends Interfaces.ModTwoPort(InPort1(redeclare type SignalType =
              Modelica.SIunits.Volume));
      parameter Real Rb(unit="m.s") = 0.01e-6 "Boiling constant";
      parameter Real Rc(unit="m.s") = 0.01e-6 "Condensation constant";
      Modelica.SIunits.Pressure pSat_liq "Saturation pressure of liquid phase";
      Modelica.SIunits.Pressure pSat_gas "Saturation pressure of gaseous phase";
      Modelica.SIunits.SpecificVolume VSat_liq
        "Saturation volume of liquid phase";
      Modelica.SIunits.SpecificVolume VSat_gas
        "Saturation volume of gaseous phase";
      Modelica.SIunits.SpecificEnthalpy hboil
        "Enthalpy of boiling of liquid water";
      Modelica.SIunits.Volume Vgas "Gas volume";
      Modelica.SIunits.Pressure pgas "Partial gas pressure";
      Modelica.SIunits.MassFlowRate Mboil "Mass flow into boiling";
      Modelica.SIunits.MassFlowRate Mcond "Mass flow into condensation";
      Boolean fd "True if forward flow";
      Modelica.SIunits.HeatFlowRate DeltaQdot
        "Heat generated by potential equilibration";
      Boolean Exist "True if flow exists";
      Modelica.SIunits.Mass Mref "Reference mass";
      Modelica.SIunits.AngularFrequency xi "Mass fraction";
      Modelica.SIunits.ThermalConductance Sdot1_aux;
      Modelica.SIunits.ThermalConductance Sdot2_aux;
      Modelica.SIunits.Volume Vsteam "Maximum volume of steam";
      Real hum1 "Relative humidity computed by gas pressure saturation";
      Real hum2 "Relative humidity computed by steam volume saturation";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[-76, 80; 40, -80],
            string="RF",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(
            extent=[32, 8; 70, -40],
            string="bc",
            style(color=41)),
          Text(
            extent=[-20, -50; 16, -78],
            string="Vgas",
            style(color=0)),
          Line(points=[-66, -48; 72, -48], style(color=41)),
          Line(points=[46, -42; 72, -48; 46, -54], style(color=41))),
        Diagram(
          Text(
            extent=[-12, -60; 10, -80],
            string="Vgas",
            style(color=0)),
          Line(points=[-94, 0; -44, 0], style(color=57)),
          Line(points=[-94, 0; -60, 0; -60, 40; -44, 40], style(color=57)),
          Line(points=[-94, 0; -60, 0; -60, -40; -44, -40], style(color=57)),
          Line(points=[94, 0; 60, 0; 60, 20; 44, 20], style(color=57)),
          Line(points=[94, 0; 60, 0; 60, -20; 44, -20], style(color=57)),
          Text(
            extent=[-80, 14; -64, 2],
            string="T1",
            style(color=57)),
          Text(
            extent=[64, 14; 80, 2],
            string="T2",
            style(color=57)),
          Line(points=[-50, 0; -50, 0], style(color=8)),
          Line(points=[-70, 0; -70, 0], style(color=8)),
          Line(points=[50, 1.22125e-015; 50, 0], style(color=8)),
          Line(points=[70, 0; 70, -1.22125e-015], style(color=8))),
        Window(
          x=0,
          y=0.01,
          width=0.44,
          height=0.65),
        Documentation(info="<html>
This model computes the boiling and condensation of water.  The thermo-bond connector to the left represents water in its liquid form, whereas the thermo-bond connector to the right represents water vapor, i.e., water in its gaseous form.
</html>"));
      Tables.pSat pSat1 annotation (extent=[-40, 30; -20, 50]);
      Tables.VSat VSat1 annotation (extent=[-40, -10; -20, 10]);
      Tables.Hboil Hboil1 annotation (extent=[-40, -50; -20, -30]);
      Tables.pSat pSat2 annotation (extent=[40, 10; 20, 30]);
      Tables.VSat VSat2 annotation (extent=[40, -30; 20, -10]);
    equation
      pSat1.u = T1;
      pSat2.u = T2;
      VSat1.u = T1;
      VSat2.u = T2;
      Hboil1.u = T1;
      pSat_liq = pSat1.y;
      pSat_gas = pSat2.y;
      VSat_liq = VSat1.y;
      VSat_gas = VSat2.y;
      hboil = Hboil1.y;
      Vgas = s;
      pgas = p2*V2/Vgas;
      Mboil = if ((pSat_liq > p1) and Exist1) then Rb*(pSat_liq - p1) else 0;
      Mcond = if ((pSat_gas < pgas) and Exist2) then Rc*(pgas - pSat_gas) else
              0;
      Mdot1 = Mboil - Mcond;
      Mdot2 = Mdot1;
      q1 = Mboil*VSat_liq - Mcond*VSat_gas;
      q2 = q1;
      fd = Mdot1 > 0;
      DeltaQdot = (g1 - g2)*Mdot1 - (p1 - p2)*q1;
      Exist = (fd and Exist1) or (not fd and Exist2);
      Mref = if fd then M1 else M2;
      xi = if Exist then Mdot1/Mref else 0;
      Sdot2_aux = if Exist2 then Sdot1 + (DeltaQdot + (T1 - T2)*Sdot1)/T1 else
              Sdot1;
      Sdot1_aux = if Exist1 then Sdot2 + (DeltaQdot + (T1 - T2)*Sdot2)/T2 else
              Sdot2;
      Sdot1 = if fd then xi*S1 + hboil*Mdot1/T1 else Sdot1_aux;
      Sdot2 = if fd then Sdot2_aux else xi*S2 - hboil*Mdot2/T2;
      Vsteam = 1/(p2/pSat_gas - 1)*Vgas;
      hum1 = pgas/pSat_gas;
      hum2 = 1 - V2/Vsteam;
    end BoilCondWater;

    model Air "Capacitive field representing air"
      extends Interfaces.PassiveOnePort;
      parameter Modelica.SIunits.Entropy S0=6.81010184 "Entropy if no air";
      parameter Modelica.SIunits.Volume V0=0.83112221e-3 "Volume if no air";
      parameter Modelica.SIunits.Mass M0=1e-3 "Mass if no air";
      parameter Modelica.SIunits.SpecificHeatCapacity cp=1004.0
        "Heat capacity of air at constant pressure";
      parameter Modelica.SIunits.SpecificHeatCapacity R=287.2 "Gas constant";
      parameter Modelica.SIunits.Mass epsM=0.5e-6
        "Smallest mass distinguishable from zero";
      parameter Boolean fict=false "True is fictitious values are used";
      parameter Modelica.SIunits.Temperature T_fict=298.53
        "Fictitious temperature is no air";
      parameter Modelica.SIunits.Pressure p_fict=1e5
        "Fictitious pressure if no air";
      Modelica.SIunits.Entropy S_int "Entropy of air";
      Modelica.SIunits.Volume V_int "Volume of air";
      Modelica.SIunits.Mass M_int "Mass of air";
      Modelica.SIunits.SpecificHeatCapacity cv
        "Heat capacity of air at constant volume";
      Modelica.SIunits.SpecificVolume v "Specific volume";
      Modelica.SIunits.SpecificEntropy s "Specific entropy";
      Real ln_v "Natural logarithm of specific volume";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[-76, 82; 40, -78],
            string="CF",
            style(color=41)),
          Text(
            extent=[32, 8; 70, -40],
            string="air",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name")),
        Diagram(Text(
            extent=[32, 8; 70, -40],
            string="air",
            style(color=41)), Text(
            extent=[-76, 82; 40, -78],
            string="CF",
            style(color=41))),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Documentation(info="<html>
This model computes the state information of a volume of air.
</html>"));
    equation
      der(M_int) = Mdot;
      der(S_int) = Sdot;
      der(V_int) = q;
      Exist = M_int > epsM;
      cv = cp - R;
      v = if Exist then V_int/M_int else 0;
      s = if Exist then S_int/M_int else 0;
      ln_v = Modelica.Math.log(V_int/M_int);
      p = if Exist or not fict then T*R*M_int/V_int else p_fict;
      T = if Exist or not fict then 293.15*exp((s - 6813.7 - R*(ln_v + 0.17245))
          /cv) else T_fict;
      g = T*(cp - s);
      M = if Exist then M_int else M0;
      V = if Exist then V_int else V0;
      S = if Exist then S_int else S0;
    end Air;

    model Air_isochoric
      extends Interfaces.PassiveOnePort;
      parameter Modelica.SIunits.Entropy S0=6.81010184 "Entropy if no air";
      parameter Modelica.SIunits.Volume V0=0.83112221e-3 "Volume if no air";
      parameter Modelica.SIunits.Mass M0=1e-3 "Mass if no air";
      parameter Modelica.SIunits.SpecificHeatCapacity cp=1004.0
        "Heat capacity of air at constant pressure";
      parameter Modelica.SIunits.SpecificHeatCapacity R=287.2 "Gas constant";
      parameter Modelica.SIunits.Mass epsM=0.5e-6
        "Smallest mass distinguishable from zero";
      parameter Boolean fict=false "True is fictitious values are used";
      parameter Modelica.SIunits.Temperature T_fict=298.53
        "Fictitious temperature is no air";
      parameter Modelica.SIunits.Pressure p_fict=1e5
        "Fictitious pressure if no air";
      parameter Modelica.SIunits.Entropy S_int0 "Initial air entropy";
      parameter Modelica.SIunits.Volume V_int "Air volume";
      parameter Modelica.SIunits.Mass M_int0 "Initial air mass";
      annotation (Icon(
          Text(
            extent=[-76,82; 40,-78],
            string="CF",
            style(color=41)),
          Text(
            extent=[32,8; 70,-40],
            string="air",
            style(color=41)),
          Text(extent=[-70,90; 70,50],   string="%name"),
          Text(
            extent=[-40,-36; 42,-66],
            style(color=58, rgbcolor={0,181,0}),
            string="isochoric")), Diagram);
      Air Air1(
        S0=S0,
        V0=V0,
        M0=M0,
        cp=cp,
        R=R,
        epsM=epsM,
        fict=fict,
        T_fict=T_fict,
        p_fict=p_fict,
        S_int(start=S_int0),
        V_int(start=V_int),
        M_int(start=M_int0)) annotation (extent=[0,-10; 20,10]);
      Bonds.fThermoBond B1 annotation (extent=[-20,-10; 0,10], rotation=180);
      Junctions.J0p3 j0p3_1 annotation (extent=[-40,10; -20,-10]);
      Sensors.fDf Df1 annotation (extent=[-60,-10; -40,10], rotation=180);
      Bonds.eThermoBond B2 annotation (extent=[-40,10; -20,30],rotation=-90);
      Sources.mSf2 mSf2_1 annotation (extent=[-40,30; -20,50],rotation=90);
      Junctions.J0p2 j0p2_1 annotation (extent=[-80,-10; -60,10]);
    equation
      connect(B1.eThBondCon1, Air1.ThBondCon1) annotation (points=[0,
            -1.22465e-015; 0,0],  style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p3_1.ThBondCon2, B1.fThBondCon1) annotation (points=[-20,0; -20,
            1.22465e-015], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(Df1.eThBondCon1, j0p3_1.ThBondCon1) annotation (points=[-40,
            -1.22465e-015; -40,0], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B2.eThBondCon1, j0p3_1.ThBondCon3) annotation (points=[-30,10;
            -30,10],                style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(mSf2_1.ThBondCon1, B2.fThBondCon1) annotation (points=[-30,30;
            -30,30],                             style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(mSf2_1.InPort1, Df1.OutPort2) annotation (points=[-30,49; -30,60;
            -60,60; -60,11],                  style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(j0p2_1.ThBondCon2, Df1.fThBondCon1) annotation (points=[-60,0;
            -60,1.22465e-015], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p2_1.ThBondCon1, ThBondCon1) annotation (points=[-80,0; -100,0],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
    end Air_isochoric;

    model Water "Capacitive field representing water"
      extends Interfaces.PassiveOnePort;
      parameter Modelica.SIunits.Entropy S0=0.2954618 "Entropy if no water";
      parameter Modelica.SIunits.Volume V0=0.99715033e-6 "Volume if no water";
      parameter Modelica.SIunits.Mass M0=1e-3 "Mass if no water";
      parameter Modelica.SIunits.Temperature T0=293.15 "Reference temperature";
      parameter Modelica.SIunits.SpecificEntropy s0=296.3
        "Reference specific entropy";
      parameter Real alpha0=1.001773
        "Reference temperature/heat capacity coefficient";
      parameter Modelica.SIunits.Mass epsM=0.5e-6
        "Smallest mass distinguishable from zero";
      parameter Modelica.SIunits.Entropy epsS=0.01
        "Smallest entropy distinguishable from zero";
      parameter Modelica.SIunits.Volume epsV=0.1e-6
        "Smallest volume distinguishable from zero";
      parameter Modelica.SIunits.SpecificEntropy corr=-0.18415
        "Temperature correction factor";
      parameter Real cw(unit="K.kg/J") = 0.24073e-3
        "Inverse heat capacity at constant entropy";
      Modelica.SIunits.Pressure pSat_liq "Saturation pressure of liquid phase";
      Modelica.SIunits.SpecificVolume VSat_liq
        "Saturation volume of liquid phase";
      Modelica.SIunits.SpecificEnergy g_corr "Correction of Gibbs potential";
      Real kappa(unit="m.s2/kg") "Temperature dependence of water pressure";
      Real alpha "Heat capacity dependence of water pressure";
      Modelica.SIunits.Entropy S_int "Entropy of water";
      Modelica.SIunits.Volume V_int "Volume of water";
      Modelica.SIunits.Mass M_int "Mass of water";
      Boolean ExistS "True if enough entropy";
      Boolean ExistV "True if enough volume";
      Boolean ExistM "True if enough mass";
      Modelica.SIunits.SpecificVolume v "Specific volume";
      Modelica.SIunits.SpecificEntropy s "Specific entropy";
      Real ln_v "Natural logarithm of specific volume";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[32, 8; 100, -40],
            string="water",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(
            extent=[-76, 82; 40, -78],
            string="CF",
            style(color=41))),
        Window(
          x=0.45,
          y=0.01,
          width=0.44,
          height=0.65),
        Diagram(
          Line(points=[-94, 0; -44, 0], style(color=57)),
          Line(points=[-94, 0; -60, 0; -60, 40; -44, 40], style(color=57)),
          Line(points=[-94, 0; -60, 0; -60, 80; -44, 80], style(color=57)),
          Line(points=[-94, 0; -60, 0; -60, -40; -44, -40], style(color=57)),
          Line(points=[-94, 0; -60, 0; -60, -80; -44, -80], style(color=57)),
          Text(
            extent=[-78, 14; -66, 2],
            string="T",
            style(color=57)),
          Line(points=[-50, 0; -50, 0], style(color=8)),
          Line(points=[-70, 0; -70, 0], style(color=8))),
        Documentation(info="<html>
This model computes the state information of a volume of water.
</html>"));
      Tables.pSat pSat1 annotation (extent=[-40, 30; -20, 50]);
      Tables.VSat VSat1 annotation (extent=[-40, -10; -20, 10]);
      Tables.gCorr gCorr1 annotation (extent=[-40, 70; -20, 90]);
      Tables.Kappa Kappa1 annotation (extent=[-40, -50; -20, -30]);
      Tables.Alpha Alpha1 annotation (extent=[-40, -90; -20, -70]);
    equation
      pSat1.u = T;
      VSat1.u = T;
      gCorr1.u = T;
      Kappa1.u = T;
      Alpha1.u = T;
      pSat_liq = pSat1.y;
      VSat_liq = VSat1.y;
      g_corr = gCorr1.y;
      kappa = Kappa1.y;
      alpha = Alpha1.y;
      der(M_int) = Mdot;
      der(S_int) = Sdot;
      der(V_int) = q;
      ExistS = S_int > epsS;
      ExistV = V_int > epsV;
      ExistM = M_int > epsM;
      Exist = ExistS and ExistV and ExistM;
      v = abs(V_int/M_int);
      s = abs(S_int/M_int);
      ln_v = Modelica.Math.log(v);
      T = T0*exp(cw*((s - s0) + corr*(ln_v + 6.906056722)));
      p = (Modelica.Math.log(VSat_liq) - ln_v)/kappa + pSat_liq;
      g = 4190.0*(T - 273.15) - T*s + g_corr;
      M = if Exist then M_int else M0;
      V = if Exist then V_int else V0;
      S = if Exist then S_int else S0;
    end Water;

    model Water_isochoric
      extends Interfaces.PassiveOnePort;
      parameter Modelica.SIunits.Entropy S0=0.2954618 "Entropy if no water";
      parameter Modelica.SIunits.Volume V0=0.99715033e-6 "Volume if no water";
      parameter Modelica.SIunits.Mass M0=1e-3 "Mass if no water";
      parameter Modelica.SIunits.Temperature T0=293.15 "Reference temperature";
      parameter Modelica.SIunits.SpecificEntropy s0=296.3
        "Reference specific entropy";
      parameter Real alpha0=1.001773
        "Reference temperature/heat capacity coefficient";
      parameter Modelica.SIunits.Mass epsM=0.5e-6
        "Smallest mass distinguishable from zero";
      parameter Modelica.SIunits.Entropy epsS=0.01
        "Smallest entropy distinguishable from zero";
      parameter Modelica.SIunits.Volume epsV=0.1e-6
        "Smallest volume distinguishable from zero";
      parameter Modelica.SIunits.SpecificEntropy corr=-0.18415
        "Temperature correction factor";
      parameter Real cw(unit="K.kg/J") = 0.24073e-3
        "Inverse heat capacity at constant entropy";
      parameter Modelica.SIunits.Entropy S_int0 "Initial water entropy";
      parameter Modelica.SIunits.Volume V_int "Water volume";
      parameter Modelica.SIunits.Mass M_int0 "Initial water mass";
      annotation (Icon(
          Text(
            extent=[32,8; 100,-40],
            string="water",
            style(color=41)),
          Text(extent=[-70,90; 70,50],   string="%name"),
          Text(
            extent=[-76,82; 40,-78],
            string="CF",
            style(color=41)),
          Text(
            extent=[-40,-36; 42,-66],
            style(color=58, rgbcolor={0,181,0}),
            string="isochoric")), Diagram);
      Bonds.fThermoBond B1 annotation (extent=[10,-10; 30,10], rotation=180);
      Junctions.J0p3 j0p3_1 annotation (extent=[-10,10; 10,-10]);
      Sensors.fDf Df1 annotation (extent=[-30,-10; -10,10], rotation=180);
      Bonds.eThermoBond B2 annotation (extent=[-10,10; 10,30], rotation=-90);
      Sources.mSf2 mSf2_1 annotation (extent=[-10,30; 10,50], rotation=90);
      Junctions.J0p2 j0p2_1 annotation (extent=[-50,-10; -30,10]);
      Water Water1(
        S0=S0,
        V0=V0,
        M0=M0,
        T0=T0,
        s0=s0,
        alpha0=alpha0,
        epsM=epsM,
        epsS=epsS,
        epsV=epsV,
        corr=corr,
        cw=cw,
        S_int(start=S_int0),
        V_int(start=V_int),
        M_int(start=M_int0))
                   annotation (extent=[30,-10; 50,10]);
    equation
      connect(j0p3_1.ThBondCon2, B1.fThBondCon1) annotation (points=[10,0; 10,
            1.22465e-015], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(Df1.eThBondCon1, j0p3_1.ThBondCon1) annotation (points=[-10,
            -1.22465e-015; -10,0], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B2.eThBondCon1, j0p3_1.ThBondCon3) annotation (points=[
            6.12323e-016,10; 0,10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(mSf2_1.ThBondCon1, B2.fThBondCon1) annotation (points=[
            -6.12323e-016,30; -6.12323e-016,30], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(mSf2_1.InPort1, Df1.OutPort2) annotation (points=[5.51091e-016,49;
            5.51091e-016,60; -30,60; -30,11], style(
          color=74,
          rgbcolor={0,0,127},
          smooth=0));
      connect(j0p2_1.ThBondCon2, Df1.fThBondCon1) annotation (points=[-30,0;
            -30,1.22465e-015], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(Water1.ThBondCon1, B1.eThBondCon1) annotation (points=[30,0; 30,
            -1.22465e-015], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(j0p2_1.ThBondCon1, ThBondCon1) annotation (points=[-50,0; -100,0],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
    end Water_isochoric;

    model WaterVapor "Capacitive field representing water vapor"
      extends Interfaces.PassiveOnePort;
      parameter Modelica.SIunits.Entropy S0=7.20560415
        "Entropy if no water vapor";
      parameter Modelica.SIunits.Volume V0=1.4784146e-3
        "Volume if no water vapor";
      parameter Modelica.SIunits.Mass M0=1e-3 "Mass if no water vapor";
      parameter Modelica.SIunits.Temperature T0=413.15 "Reference temperature";
      parameter Modelica.SIunits.SpecificEntropy s0=6924.0
        "Reference specific entropy";
      parameter Real ln_v0=-0.676486739
        "Reference logarithm of specific volume";
      parameter Modelica.SIunits.SpecificHeatCapacity cp=1860.0
        "Heat capacity of air at constant pressure";
      parameter Modelica.SIunits.SpecificHeatCapacity R=461.504302
        "Gas constant";
      parameter Modelica.SIunits.Mass epsM=0.5e-6
        "Smallest mass distinguishable from zero";
      parameter Boolean fict=false "True is fictitious values are used";
      parameter Modelica.SIunits.Temperature T_fict=373.15
        "Fictitious temperature is no air";
      parameter Modelica.SIunits.Pressure p_fict=1.0032e5
        "Fictitious pressure if no air";
      parameter Real p_corr=0.60797152 "Pressure correction coefficient";
      parameter Real T_corr1=3.4 "First temperature correction coefficient";
      parameter Real T_corr2=2.9176 "Second temperature correction coefficient";
      Modelica.SIunits.SpecificHeatCapacity cv
        "Heat capacity of water vapor at constant volume";
      Modelica.SIunits.SpecificVolume v "Specific volume";
      Modelica.SIunits.SpecificEntropy s "Specific entropy";
      Real ln_v "Natural logarithm of specific volume";
      annotation (
        Coordsys(
          extent=[-100, -100; 100, 100],
          grid=[2, 2],
          component=[20, 20]),
        Icon(
          Text(
            extent=[32, 8; 100, -40],
            string="vapor",
            style(color=41)),
          Text(extent=[-70, 90; 70, 50], string="%name"),
          Text(
            extent=[-76, 82; 40, -78],
            string="CF",
            style(color=41))),
        Window(
          x=0.4,
          y=0.4,
          width=0.6,
          height=0.6),
        Diagram(
          Line(points=[-70, 0; -70, 0], style(color=8)),
          Text(
            extent=[-76,82; 40,-78],
            string="CF",
            style(color=41)),
          Text(
            extent=[32,8; 100,-40],
            string="vapor",
            style(color=41))),
        Documentation(info="<html>
This model computes the state information of a volume of water vapor.
</html>"));
    equation
      der(M) = Mdot;
      der(S) = Sdot;
      der(V) = q;
      Exist = M > epsM;
      cv = cp - R;
      v = V/M;
      s = S/M;
      ln_v = Modelica.Math.log(V/M);
      p = if Exist or not fict then (373.15 + p_corr*(T - 373.15))*R/v else
        p_fict;
      T = if Exist or not fict then T0*exp(((s - s0)*T_corr1 - T_corr2*R*(ln_v
         - ln_v0))/cv) else T_fict;
      g = 2.5005e6 + 1860.0*(T - 273.15) - T*s;
    end WaterVapor;
  end Substances;

  package Examples "Example models of using the thermo-bond graph library"
    annotation (Icon(
        Rectangle(extent=[-100,-100; 80,50],   style(
            color=0,
            fillColor=30,
            fillPattern=1)),
        Polygon(points=[-100,50; -80,70; 100,70; 80,50; -100,50],      style(
            color=0,
            fillColor=30,
            fillPattern=1)),
        Polygon(points=[100,70; 100,-80; 80,-100; 80,50; 100,70],      style(
            color=0,
            fillColor=30,
            fillPattern=1)),
        Text(
          extent=[-85,71; 65,-49],
          string="Sample",
          style(color=0)),
        Text(
          extent=[-118,114; 122,65],
          string="%name",
          style(color=1)),
        Text(
          extent=[-97,23; 78,-98],
          string="Programs",
          style(color=0))), Documentation(info="<html>
This package contains examples of how to use the library for modeling convective flows.  Currently included in this set of examples are models representing: <p>

<ol>
<li>a pressure cooker, <br>
<li>an air balloon being filled, and <br>
<li>circular water flow through a set of pipes, where the water is being moved around by a pump.
</ol>
</html>"));
    model PressureCooker "Pressure Cooker"
      parameter Modelica.SIunits.Temperature Tcover=293.15
        "Temperature of cover";
      parameter Modelica.SIunits.Temperature Tbottom=393.15
        "Temperature of heating element";
      parameter Modelica.SIunits.ThermalConductance HE_bottom_water_lambda=0.35
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_air_vapor_lambda=0.35
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_water_air_lambda=0.2
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_water_vapor_lambda=2.0
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_vapor_boundair_lambda=0.025
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_air_boundvapor_lambda=0.025
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_vapor_boundvapor_lambda=0.08
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_air_boundair_lambda=0.08
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance
        HE_boundair_boundvapor_lambda =                                           0.35
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_boundair_cover_lambda=0.25
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_boundvapor_cover_lambda=0.25
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance
        HE_bottom_boundvapor_lambda1 =                                           0.01
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance
        HE_bottom_boundvapor_lambda2 =                                           0.03
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_bottom_boundair_lambda1=0.01
        "Thermal conductance";
      parameter Modelica.SIunits.ThermalConductance HE_bottom_boundair_lambda2=0.03
        "Thermal conductance";
      parameter Modelica.SIunits.Time SwitchTime=10000
        "Time of switching from heating to cooling";
      parameter Modelica.SIunits.VolumeFlowRate kRF_vapor=0.105e-6
        "Forced flow between bulk and boundary layer";
      parameter Modelica.SIunits.VolumeFlowRate kRF_air=0.105e-6
        "Forced flow between bulk and boundary layer";
      Modelica.SIunits.ThermalConductance HE_bottom_boundvapor_lambda;
      Modelica.SIunits.ThermalConductance HE_bottom_boundair_lambda;
      Modelica.SIunits.Volume CF_Air_V "Air volume";
      Modelica.SIunits.Volume CF_BoundaryAir_V "Air volume in boundary layer";
      Modelica.SIunits.Mass CF_Air_M "Air mass";
      Modelica.SIunits.Mass CF_BoundaryAir_M "Air mass in boundary layer";
      Modelica.SIunits.Volume CF_Vapor_V "Water vapor volume";
      Modelica.SIunits.Volume CF_BoundaryVapor_V
        "Water vapor volume in boundary layer";
      Modelica.SIunits.Mass CF_Vapor_M "Water vapor mass";
      Modelica.SIunits.Mass CF_BoundaryVapor_M
        "Water vapor mass in boundary layer";
      Modelica.SIunits.Volume CF_Water_V "Water volume";
      Boolean CF_Water_Exist "True if there is water";
      Real Volume_frac "Volume fraction";
      Real Volume_frac_boundary "Volume fraction in boundary layer";
      Modelica.SIunits.Volume Vtot "Total volume";
      output Modelica.SIunits.Temperature T_air;
      output Modelica.SIunits.Temperature T_steam;
      output Modelica.SIunits.Temperature T_water;
      output Modelica.SIunits.Temperature T_air_boundary;
      output Modelica.SIunits.Temperature T_water_boundary;
      output Modelica.SIunits.Pressure p_air;
      output Modelica.SIunits.Pressure p_steam;
      output Modelica.SIunits.Pressure p_water;
      output Modelica.SIunits.Pressure p_air_boundary;
      output Modelica.SIunits.Pressure p_water_boundary;
      output Real Humidity;
      output Real Humidity_boundary;
      output Real Mass_frac "Mass fraction";
      output Real Mass_frac_boundary "Mass fraction in boundary layer";
      annotation (
        Coordsys(extent=[-200,-150; 220,170], scale=0.1),
        Diagram(
          Text(
            extent=[-18,-112; 22,-128],
            string="Water",
            style(color=57)),
          Text(
            extent=[-128,-10; -88,-26],
            string="Air",
            style(color=57)),
          Text(
            extent=[94,-10; 134,-26],
            string="Vapor",
            style(color=57)),
          Rectangle(extent=[-62,-74; 88,-140],   style(color=57)),
          Rectangle(extent=[-168,30; -20,-26],   style(color=57)),
          Rectangle(extent=[-10,56; 170,-26],   style(color=57)),
          Text(
            extent=[90,94; 130,78],
            string="Vapor",
            style(color=57)),
          Text(
            extent=[90,82; 130,66],
            string="Boundary",
            style(color=57)),
          Rectangle(extent=[170,64; 54,158],   style(color=57)),
          Rectangle(extent=[-170,66; -50,160],   style(color=57)),
          Text(
            extent=[-132,94; -92,78],
            string="Air",
            style(color=57)),
          Text(
            extent=[-130,82; -90,66],
            string="Boundary",
            style(color=57)),
          Line(points=[-100,100; -100,100],   style(color=8)),
          Line(points=[-72,80; -72,80],   style(color=8)),
          Line(points=[20,140; 20,140],   style(color=8)),
          Line(points=[132,122; 132,120],   style(color=8)),
          Line(points=[132,140; 132,140],   style(color=8)),
          Line(points=[-90,-110; -90,-110],   style(color=8)),
          Line(points=[174,74; 174,74],   style(color=8)),
          Line(points=[174,54; 174,54],   style(color=8)),
          Line(points=[-174,74; -174,74],   style(color=8)),
          Line(points=[-174,54; -174,54],   style(color=8))),
        experiment(StopTime=20000, Tolerance=1e-010),
        experimentSetupOutput,
        Documentation(info="<html>
This model describes the functioning of a pressure cooker.  It consists of five different volumes (capacitive fields): water, air (bulk), steam (bulk), air (boundary layer), and steam (boundary layer) with apropriate potential equilibration flows (resistive fields) between them. <p>

The pressure cooker is heated from the bottom.  At time 10,000 seconds, cold water is poured over it to cool it down. <p>

Simulate across 20,000 seconds and plot temperatures, pressures, and relative humidity.
</html>"),
        Icon(
          Line(points=[-66,40; 66,40; 62,46; 4,46; 4,54; 8,54; 8,60; -8,60; -8,
                54; -4,54; -4,46; -62,46; -66,40], style(
              color=74,
              rgbcolor={0,0,127},
              smooth=0,
              fillColor=74,
              rgbfillColor={0,0,127},
              fillPattern=1)),
          Rectangle(extent=[-60,40; 60,-20], style(color=74, rgbcolor={0,0,127})),
          Rectangle(extent=[-60,-6; 60,-20], style(
              color=74,
              rgbcolor={0,0,127},
              fillColor=71,
              rgbfillColor={85,170,255},
              fillPattern=1)),
          Rectangle(extent=[-60,40; 60,-6], style(
              color=74,
              rgbcolor={0,0,127},
              fillColor=31,
              rgbfillColor={170,255,255},
              fillPattern=1))));

      Bonds.fThermoBond B1               annotation (extent=[-110,-140; -90,
            -120]);
      Bonds.eThermoBond B2               annotation (extent=[-70,-140; -50,-120]);
      Passive.HE HE1               annotation (extent=[-90,-140; -70,-120]);
      Junctions.J0p5 J0p5_1               annotation (extent=[-50,-80; -10,-120]);
      Bonds.fThermoBond B3               annotation (extent=[-10,-110; 10,-90],
            rotation=180);
      Junctions.J0p5 J0p5_2               annotation (extent=[10,-80; 50,-120]);
      Bonds.eThermoBond B4               annotation (extent=[50,-140; 70,-120]);
      Substances.Water Water1(
        S_int(start=14.77309),
        M_int(start=50e-3),
        V_int(start=0.049857665e-3),
        epsM=7E-7)       annotation (extent=[70,-140; 90,-120]);
      Junctions.J0p6 J0p6_1               annotation (extent=[-160,-20; -120,20]);
      Bonds.fThermoBond B5               annotation (extent=[-120,-10; -100,10],
               rotation=180);
      Junctions.J0p6 J0p6_2               annotation (extent=[-100,-20; -60,20]);
      Bonds.eThermoBond B6               annotation (extent=[-60,-10; -40,10]);
      Substances.Air Air1(
        S_int(start=7.374476568),
        M_int(start=1.082873165e-3),
        V_int(start=0.9e-3))      annotation (extent=[-40,-10; -20,10]);
      Junctions.J0p5 J0p5_3               annotation (extent=[40,-20; 0,20]);
      Bonds.fThermoBond B7               annotation (extent=[40,-10; 60,10],
          rotation=180);
      Junctions.J0p5 J0p5_4               annotation (extent=[100,-20; 60,20]);
      Bonds.fThermoBond B8               annotation (extent=[100,-10; 120,10]);
      Junctions.J0p5 J0p5_5               annotation (extent=[120,20; 160,-20]);
      Bonds.eThermoBond B9               annotation (extent=[70,20; 90,40],
          rotation=90);
      Substances.WaterVapor WaterVapor1(
        M(start=0.0127859e-3),
        epsM=1e-7,
        S(start=0.09213013),
        V(start=0.0189028e-3))
                            annotation (extent=[70,40; 90,60],   rotation=90);
      Junctions.J0p6 J0p6_3               annotation (extent=[120,80; 160,120]);
      Bonds.fThermoBond B10               annotation (extent=[100,90; 120,110],
            rotation=180);
      Junctions.J0p6 J0p6_4               annotation (extent=[60,80; 100,120]);
      Substances.WaterVapor WaterVapor2(
        M(start=0.000255718e-3),
        epsM=1e-8,
        S(start=0.001842602),
        V(start=0.000378056e-3))
                              annotation (extent=[102,140; 82,160]);
      Junctions.J0p6 J0p6_5               annotation (extent=[-160,80; -120,120]);
      Bonds.fThermoBond B12               annotation (extent=[-120,90; -100,110]);
      Bonds.eThermoBond B13               annotation (extent=[-142,120; -122,
            140], rotation=90);
      Substances.Air Air2(
        S_int(start=0.14748953),
        M_int(start=0.021657463e-3),
        V_int(start=0.018e-3))    annotation (extent=[-142,140; -122,160],
          rotation=90);
      Bonds.fThermoBond B14               annotation (extent=[-60,-30; -40,-10]);
      Passive.PVE PVE1(G=0.01e-6)            annotation (extent=[-40,-30; -20,
            -10]);
      Bonds.eThermoBond B15               annotation (extent=[-20,-30; 0,-10]);
      Bonds.fThermoBond B16               annotation (extent=[-60,-50; -40,-30]);
      Passive.HE HE2               annotation (extent=[-40,-50; -20,-30]);
      Bonds.eThermoBond B17               annotation (extent=[-20,-50; 0,-30]);
      Bonds.eThermoBond B18               annotation (extent=[-158,-40; -138,
            -20], rotation=90);
      Passive.PVE PVE2(G=0.01e-6)            annotation (extent=[-158,-60; -138,
            -40],   rotation=90);
      Bonds.fThermoBond B19               annotation (extent=[-158,-80; -138,
            -60], rotation=90);
      Bonds.eThermoBond B20               annotation (extent=[-138,-40; -118,
            -20], rotation=90);
      Passive.HE HE3               annotation (extent=[-138,-60; -118,-40],
          rotation=90);
      Bonds.fThermoBond B21               annotation (extent=[-138,-80; -118,
            -60], rotation=90);
      Bonds.fThermoBond B22               annotation (extent=[0,-60; 20,-40]);
      Substances.BoilCondWater BoilCondWater1(Rb=0.1e-6, Rc=0.1e-6)
        annotation (extent=[20,-60; 40,-40]);
      Bonds.eThermoBond B23               annotation (extent=[40,-60; 60,-40]);
      Bonds.fThermoBond B24               annotation (extent=[20,-80; 40,-60]);
      Passive.HE HE4               annotation (extent=[40,-80; 60,-60]);
      Bonds.eThermoBond B25               annotation (extent=[60,-80; 80,-60]);
      Bonds.fThermoBond B26               annotation (extent=[60,-100; 80,-80]);
      Passive.PVE PVE3(G=0.01e-6)            annotation (extent=[80,-100; 100,
            -80]);
      Bonds.eThermoBond B27               annotation (extent=[100,-100; 120,-80]);
      Bonds.fThermoBond B28               annotation (extent=[180,10; 200,30],
            rotation=-90);
      Substances.BoilCondWater BoilCondWater2(Rb=0.00196e-6, Rc=0.04e-6)
         annotation (extent=[200,10; 180,-10],   rotation=-90);
      Bonds.eThermoBond B29               annotation (extent=[180,-30; 200,-10],
               rotation=-90);
      Bonds.fThermoBond B30               annotation (extent=[-32,70; -12,90],
            rotation=-180);
      Passive.HE HE5               annotation (extent=[-52,90; -32,70]);
      Bonds.eThermoBond B31               annotation (extent=[-72,70; -52,90],
            rotation=-180);
      Bonds.fThermoBond B32               annotation (extent=[12,70; 32,90]);
      Passive.HE HE6               annotation (extent=[32,90; 52,70]);
      Bonds.eThermoBond B33               annotation (extent=[52,70; 72,90]);
      Bonds.fThermoBond B34               annotation (extent=[-30,50; -10,70],
            rotation=-180);
      Passive.PVE PVE4(G=0.00001e-6)            annotation (extent=[-50,50; -30,
            70]);
      Bonds.eThermoBond B35               annotation (extent=[-70,50; -50,70],
            rotation=-180);
      Bonds.fThermoBond B36               annotation (extent=[12,50; 32,70]);
      Passive.PVE PVE5(G=0.00001e-6)            annotation (extent=[32,50; 52,
            70]);
      Bonds.eThermoBond B37               annotation (extent=[52,50; 72,70]);
      Bonds.fThermoBond B38               annotation (extent=[120,20; 140,40],
            rotation=90);
      Passive.HE HE7               annotation (extent=[140,40; 120,60],
          rotation=90);
      Bonds.eThermoBond B39               annotation (extent=[120,60; 140,80],
            rotation=90);
      Bonds.fThermoBond B40               annotation (extent=[140,20; 160,40],
            rotation=90);
      Passive.RFq RFq1               annotation (extent=[140,40; 160,60],
          rotation=90);
      Bonds.eThermoBond B41               annotation (extent=[140,60; 160,80],
            rotation=90);
      Bonds.fThermoBond B42               annotation (extent=[164,34; 184,54],
            rotation=90);
      Bonds.eThermoBond B43               annotation (extent=[164,74; 184,94],
            rotation=90);
      Bonds.fThermoBond B44               annotation (extent=[-140,20; -120,40],
               rotation=90);
      Passive.HE HE8               annotation (extent=[-140,40; -120,60],
          rotation=90);
      Bonds.eThermoBond B45               annotation (extent=[-140,60; -120,80],
               rotation=90);
      Bonds.fThermoBond B46               annotation (extent=[-160,20; -140,40],
               rotation=90);
      Passive.RFq RFq2               annotation (extent=[-160,40; -140,60],
          rotation=90);
      Bonds.eThermoBond B47               annotation (extent=[-160,60; -140,80],
               rotation=90);
      Bonds.eThermoBond B48               annotation (extent=[-184,74; -164,94],
               rotation=90);
      Bonds.fThermoBond B49               annotation (extent=[-184,34; -164,54],
               rotation=90);
      Passive.PVE PVE6(G=0.01e-6)            annotation (extent=[-10,90; 10,110]);
      Bonds.fThermoBond B50               annotation (extent=[-30,90; -10,110]);
      Bonds.eThermoBond B51               annotation (extent=[10,90; 30,110]);
      Bonds.fThermoBond B52               annotation (extent=[-30,110; -10,130]);
      Passive.HE HE9               annotation (extent=[-10,130; 10,110]);
      Bonds.eThermoBond B53               annotation (extent=[10,110; 30,130]);
      Bonds.fThermoBond B54               annotation (extent=[-60,130; -40,150]);
      Passive.HE HE10               annotation (extent=[-40,150; -20,130]);
      Bonds.eThermoBond B55               annotation (extent=[-20,130; 0,150]);
      Sources.Se Se2(              T0=Tcover) annotation (extent=[40,150; 60,
            170]);
      Bonds.eThermoBond B56               annotation (extent=[20,130; 40,150],
            rotation=180);
      Bonds.fThermoBond B57               annotation (extent=[60,130; 80,150],
            rotation=180);
      Passive.HE HE11               annotation (extent=[40,150; 60,130]);
      Junctions.J0p6 J0p6_6               annotation (extent=[-100,80; -60,120]);
      Junctions.J0p3 J0p3_1               annotation (extent=[0,150; 20,130]);
      Bonds.eThermoBond B58               annotation (extent=[20,150; 40,170]);
      Junctions.J0p3 J0p3_2               annotation (extent=[122,140; 142,160]);
      Bonds.eThermoBond B59               annotation (extent=[102,140; 122,160],
               rotation=180);
      Junctions.J0p4 J0p4_1               annotation (extent=[-130,-140; -110,
            -120]);
      Bonds.fThermoBond B60               annotation (extent=[-110,-120; -90,
            -100], rotation=180);
      Passive.HE HE12               annotation (extent=[216,-74; 196,-94],
          rotation=-90);
      Bonds.eThermoBond B61               annotation (extent=[196,-74; 216,-54],
               rotation=90);
      Bonds.fThermoBond B62               annotation (extent=[196,-114; 216,-94],
                  rotation=90);
      Bonds.fThermoBond B11               annotation (extent=[122,120; 142,140],
               rotation=-90);
      Bonds.fThermoBond B63               annotation (extent=[-198,-116; -178,
            -96], rotation=90);
      Passive.HE HE13               annotation (extent=[-198,-76; -178,-96],
          rotation=-90);
      Bonds.eThermoBond B64               annotation (extent=[-198,-76; -178,
            -56], rotation=90);
      Sources.mSe mSe1               annotation (extent=[-90,-120; -70,-100]);
      Passive.RFV RFV1(G=1E-10)              annotation (extent=[164,54; 184,74],
                   rotation=90);
      Passive.RFV RFV2(G=1E-10)              annotation (extent=[-184,54; -164,
            74],       rotation=90);
    equation
      connect(B1.fThBondCon1,HE1. ThBondCon1) annotation (points=[-90,-130; -90,
            -130],      style(color=8));
      connect(HE1.ThBondCon2,B2. fThBondCon1) annotation (points=[-70,-130; -70,
            -130],   style(color=8));
      connect(J0p5_2.ThBondCon1,B3. eThBondCon1) annotation (points=[10,-100;
            10,-100],  style(color=8));
      connect(B3.fThBondCon1,J0p5_1. ThBondCon2) annotation (points=[-10,-100;
            -10,-100],  style(color=8));
      connect(B2.eThBondCon1,J0p5_1. ThBondCon4) annotation (points=[-50,-130;
            -30,-130; -30,-120],   style(color=8));
      connect(J0p5_2.ThBondCon4,B4. fThBondCon1) annotation (points=[30,-120;
            30,-130; 50,-130],   style(color=8));
      connect(B4.eThBondCon1,Water1. ThBondCon1) annotation (points=[70,-130;
            70,-130],  style(color=8));
      connect(B5.fThBondCon1,J0p6_1. ThBondCon2) annotation (points=[-120,
            1.22465e-015; -120,0],  style(color=8));
      connect(J0p6_2.ThBondCon1,B5. eThBondCon1) annotation (points=[-100,0;
            -100,-1.22465e-015],  style(color=8));
      connect(J0p6_2.ThBondCon2,B6. fThBondCon1) annotation (points=[-60,0; -60,
            0],   style(color=8));
      connect(B6.eThBondCon1,Air1. ThBondCon1) annotation (points=[-40,0; -40,0],
                style(color=8));
      connect(B7.fThBondCon1,J0p5_3. ThBondCon1) annotation (points=[40,
            1.22465e-015; 40,0],
                style(color=8));
      connect(J0p5_4.ThBondCon2,B7. eThBondCon1) annotation (points=[60,0; 60,
            -1.22465e-015],
                style(color=8));
      connect(J0p5_4.ThBondCon1,B8. eThBondCon1) annotation (points=[100,0; 100,
            0],   style(color=8));
      connect(B8.fThBondCon1,J0p5_5. ThBondCon1) annotation (points=[120,0; 120,
            0],   style(color=8));
      connect(J0p5_4.ThBondCon4,B9. fThBondCon1) annotation (points=[80,20; 80,
            20],   style(color=8));
      connect(B9.eThBondCon1,WaterVapor1. ThBondCon1) annotation (points=[80,40;
            80,40],    style(color=8));
      connect(J0p6_3.ThBondCon1,B10. eThBondCon1) annotation (points=[120,100;
            120,100],  style(color=8));
      connect(B10.fThBondCon1,J0p6_4. ThBondCon2) annotation (points=[100,100;
            100,100],  style(color=8));
      connect(J0p6_5.ThBondCon2,B12. eThBondCon1) annotation (points=[-120,100;
            -120,100],    style(color=8));
      connect(B14.fThBondCon1,PVE1. ThBondCon1) annotation (points=[-40,-20;
            -40,-20],  style(color=8));
      connect(PVE1.ThBondCon2,B15. fThBondCon1) annotation (points=[-20,-20;
            -20,-20],  style(color=8));
      connect(J0p6_2.ThBondCon5,B14. eThBondCon1) annotation (points=[-72,-20;
            -60,-20],  style(color=8));
      connect(B15.eThBondCon1,J0p5_3. ThBondCon5) annotation (points=[0,-20; 12,
            -20],   style(color=8));
      connect(B16.fThBondCon1,HE2. ThBondCon1) annotation (points=[-40,-40; -40,
            -40],   style(color=8));
      connect(HE2.ThBondCon2,B17. fThBondCon1) annotation (points=[-20,-40; -20,
            -40],   style(color=8));
      connect(J0p6_2.ThBondCon3,B16. eThBondCon1) annotation (points=[-88,-20;
            -88,-40; -60,-40],   style(color=8));
      connect(B17.eThBondCon1,J0p5_3. ThBondCon3) annotation (points=[0,-40; 28,
            -40; 28,-20],    style(color=8));
      connect(B18.eThBondCon1,J0p6_1. ThBondCon3) annotation (points=[-148,-20;
            -148,-20],    style(color=8));
      connect(PVE2.ThBondCon2,B18. fThBondCon1) annotation (points=[-148,-40;
            -148,-40],  style(color=8));
      connect(B19.fThBondCon1,PVE2. ThBondCon1) annotation (points=[-148,-60;
            -148,-60],  style(color=8));
      connect(J0p5_1.ThBondCon1,B19. eThBondCon1) annotation (points=[-50,-100;
            -148,-100; -148,-80],     style(color=8));
      connect(HE3.ThBondCon2,B20. fThBondCon1) annotation (points=[-128,-40;
            -128,-40],  style(color=8));
      connect(B21.fThBondCon1,HE3. ThBondCon1) annotation (points=[-128,-60;
            -128,-60],  style(color=8));
      connect(B20.eThBondCon1,J0p6_1. ThBondCon5) annotation (points=[-128,-20;
            -132,-20],    style(color=8));
      connect(J0p5_1.ThBondCon3,B21. eThBondCon1) annotation (points=[-38,-80;
            -128,-80],  style(color=8));
      connect(B22.fThBondCon1,BoilCondWater1. ThBondCon1) annotation (points=[20,-50;
            20,-50],         style(color=8));
      connect(BoilCondWater1.ThBondCon2,B23. fThBondCon1) annotation (points=[40,-50;
            40,-50],         style(color=8));
      connect(B23.eThBondCon1,J0p5_4. ThBondCon5) annotation (points=[60,-50;
            72,-50; 72,-20],   style(color=8));
      connect(J0p5_1.ThBondCon5,B22. eThBondCon1) annotation (points=[-22,-80;
            -22,-50; 0,-50],   style(color=8));
      connect(B24.fThBondCon1,HE4. ThBondCon1) annotation (points=[40,-70; 40,
            -70], style(color=8));
      connect(HE4.ThBondCon2,B25. fThBondCon1) annotation (points=[60,-70; 60,
            -70], style(color=8));
      connect(B24.eThBondCon1,J0p5_2. ThBondCon3) annotation (points=[20,-70;
            20,-80; 22,-80],
                      style(color=8));
      connect(B25.eThBondCon1,J0p5_4. ThBondCon3) annotation (points=[80,-70;
            88,-70; 88,-20],   style(color=8));
      connect(PVE3.ThBondCon2,B27. fThBondCon1) annotation (points=[100,-90;
            100,-90],  style(color=8));
      connect(B26.fThBondCon1,PVE3. ThBondCon1) annotation (points=[80,-90; 80,
            -90],   style(color=8));
      connect(B26.eThBondCon1,J0p5_2. ThBondCon5) annotation (points=[60,-90;
            38,-90; 38,-80],   style(color=8));
      connect(B27.eThBondCon1,J0p5_5. ThBondCon4) annotation (points=[120,-90;
            140,-90; 140,-20],   style(color=8));
      connect(J0p6_3.ThBondCon6,B28. eThBondCon1) annotation (points=[148,120;
            148,130; 190,130; 190,30],    style(color=8));
      connect(B29.eThBondCon1,J0p5_2. ThBondCon2) annotation (points=[190,-30;
            190,-100; 50,-100],   style(color=8));
      connect(HE5.ThBondCon1,B31. fThBondCon1) annotation (points=[-52,80; -52,
            80],   style(color=8));
      connect(B30.fThBondCon1,HE5. ThBondCon2) annotation (points=[-32,80; -32,
            80],   style(color=8));
      connect(B34.fThBondCon1,PVE4. ThBondCon2) annotation (points=[-30,60; -30,
            60],   style(color=8));
      connect(PVE4.ThBondCon1,B35. fThBondCon1) annotation (points=[-50,60; -50,
            60],   style(color=8));
      connect(B33.eThBondCon1,J0p6_4. ThBondCon3) annotation (points=[72,80; 72,
            80],   style(color=8));
      connect(HE6.ThBondCon2,B33. fThBondCon1) annotation (points=[52,80; 52,80],
                 style(color=8));
      connect(B32.fThBondCon1,HE6. ThBondCon1) annotation (points=[32,80; 32,80],
                 style(color=8));
      connect(B37.eThBondCon1,J0p6_4. ThBondCon5) annotation (points=[72,60; 88,
            60; 88,80],    style(color=8));
      connect(PVE5.ThBondCon2,B37. fThBondCon1) annotation (points=[52,60; 52,
            60], style(color=8));
      connect(B36.fThBondCon1,PVE5. ThBondCon1) annotation (points=[32,60; 32,
            60], style(color=8));
      connect(J0p5_5.ThBondCon3,B38. eThBondCon1) annotation (points=[132,20;
            130,20],  style(color=8));
      connect(B38.fThBondCon1,HE7. ThBondCon1) annotation (points=[130,40; 130,
            40],   style(color=8));
      connect(HE7.ThBondCon2,B39. fThBondCon1) annotation (points=[130,60; 130,
            60],   style(color=8));
      connect(B39.eThBondCon1,J0p6_3. ThBondCon3) annotation (points=[130,80;
            132,80],  style(color=8));
      connect(J0p5_5.ThBondCon5,B40. eThBondCon1) annotation (points=[148,20;
            150,20],  style(color=8));
      connect(B40.fThBondCon1,RFq1. ThBondCon1) annotation (points=[150,40; 150,
            40],   style(color=8));
      connect(RFq1.ThBondCon2,B41. fThBondCon1) annotation (points=[150,60; 150,
            60],   style(color=8));
      connect(B41.eThBondCon1,J0p6_3. ThBondCon5) annotation (points=[150,80;
            148,80],  style(color=8));
      connect(B43.eThBondCon1,J0p6_3. ThBondCon2) annotation (points=[174,94;
            174,100; 160,100],   style(color=8));
      connect(J0p5_5.ThBondCon2,B42. eThBondCon1) annotation (points=[160,0;
            174,0; 174,34],   style(color=8));
      connect(J0p6_1.ThBondCon6,B44. eThBondCon1) annotation (points=[-132,20;
            -130,20],  style(color=8));
      connect(B44.fThBondCon1,HE8. ThBondCon1) annotation (points=[-130,40;
            -130,40],  style(color=8));
      connect(HE8.ThBondCon2,B45. fThBondCon1) annotation (points=[-130,60;
            -130,60],  style(color=8));
      connect(B45.eThBondCon1,J0p6_5. ThBondCon5) annotation (points=[-130,80;
            -132,80],  style(color=8));
      connect(J0p6_1.ThBondCon4,B46. eThBondCon1) annotation (points=[-148,20;
            -150,20],  style(color=8));
      connect(B46.fThBondCon1,RFq2. ThBondCon1) annotation (points=[-150,40;
            -150,40],  style(color=8));
      connect(RFq2.ThBondCon2,B47. fThBondCon1) annotation (points=[-150,60;
            -150,60],  style(color=8));
      connect(B47.eThBondCon1,J0p6_5. ThBondCon3) annotation (points=[-150,80;
            -148,80],  style(color=8));
      connect(B48.eThBondCon1,J0p6_5. ThBondCon1) annotation (points=[-174,94;
            -174,100; -160,100],   style(color=8));
      connect(J0p6_1.ThBondCon1,B49. eThBondCon1) annotation (points=[-160,0;
            -174,0; -174,34],   style(color=8));
      connect(B50.fThBondCon1,PVE6. ThBondCon1) annotation (points=[-10,100;
            -10,100],  style(color=8));
      connect(PVE6.ThBondCon2,B51. fThBondCon1) annotation (points=[10,100; 10,
            100],   style(color=8));
      connect(B51.eThBondCon1,J0p6_4. ThBondCon1) annotation (points=[30,100;
            60,100],  style(color=8));
      connect(B52.fThBondCon1,HE9. ThBondCon1) annotation (points=[-10,120; -10,
            120],   style(color=8));
      connect(HE9.ThBondCon2,B53. fThBondCon1) annotation (points=[10,120; 10,
            120], style(color=8));
      connect(B53.eThBondCon1,J0p6_4. ThBondCon4) annotation (points=[30,120;
            72,120],  style(color=8));
      connect(B54.fThBondCon1,HE10. ThBondCon1) annotation (points=[-40,140;
            -40,140],  style(color=8));
      connect(HE10.ThBondCon2,B55. fThBondCon1) annotation (points=[-20,140;
            -20,140],  style(color=8));
      connect(J0p6_4.ThBondCon6,B57. eThBondCon1) annotation (points=[88,120;
            88,140; 80,140],   style(color=8));
      connect(B57.fThBondCon1,HE11. ThBondCon2) annotation (points=[60,140; 60,
            140],   style(color=8));
      connect(HE11.ThBondCon1,B56. fThBondCon1) annotation (points=[40,140; 40,
            140],   style(color=8));
      connect(B12.fThBondCon1,J0p6_6. ThBondCon1) annotation (points=[-100,100;
            -100,100],    style(color=8));
      connect(B31.eThBondCon1,J0p6_6. ThBondCon5) annotation (points=[-72,80;
            -72,80],  style(color=8));
      connect(B35.eThBondCon1,J0p6_6. ThBondCon3) annotation (points=[-70,60;
            -88,60; -88,80],   style(color=8));
      connect(J0p6_6.ThBondCon2,B50. eThBondCon1) annotation (points=[-60,100;
            -30,100],  style(color=8));
      connect(J0p6_6.ThBondCon6,B52. eThBondCon1) annotation (points=[-72,120;
            -30,120],  style(color=8));
      connect(B56.eThBondCon1,J0p3_1. ThBondCon2) annotation (points=[20,140;
            20,140],  style(color=8));
      connect(B55.eThBondCon1,J0p3_1. ThBondCon1) annotation (points=[0,140; 0,
            140],   style(color=8));
      connect(J0p6_6.ThBondCon4,B54. eThBondCon1) annotation (points=[-88,120;
            -88,140; -60,140],   style(color=8));
      connect(B58.eThBondCon1,Se2. ThBondCon1) annotation (points=[40,160; 40,
            160], style(color=8));
      connect(J0p3_1.ThBondCon3,B58. fThBondCon1) annotation (points=[10,150;
            10,160; 20,160],   style(color=8));
      connect(J0p6_5.ThBondCon6,B13. fThBondCon1) annotation (points=[-132,120;
            -132,120],    style(color=8));
      connect(B13.eThBondCon1,Air2. ThBondCon1) annotation (points=[-132,140;
            -132,140],  style(color=8));
      connect(J0p3_2.ThBondCon1,B59. fThBondCon1) annotation (points=[122,150;
            122,150],  style(color=8));
      connect(B59.eThBondCon1,WaterVapor2. ThBondCon1) annotation (points=[102,150;
            102,150],       style(color=8));
      connect(J0p4_1.ThBondCon2,B1. eThBondCon1) annotation (points=[-110,-130;
            -110,-130],    style(color=8));
      connect(B60.fThBondCon1,J0p4_1. ThBondCon4) annotation (points=[-110,-110;
            -120,-110; -120,-120],     style(color=8));
      connect(HE12.ThBondCon2,B61. fThBondCon1) annotation (points=[206,-74;
            206,-74],  style(color=8));
      connect(B62.fThBondCon1,HE12. ThBondCon1) annotation (points=[206,-94;
            206,-94],  style(color=8));
      connect(J0p4_1.ThBondCon3,B62. eThBondCon1) annotation (points=[-120,-140;
            -120,-148; 206,-148; 206,-114],      style(color=8));
      connect(B61.eThBondCon1,J0p3_2. ThBondCon2) annotation (points=[206,-54;
            206,150; 142,150],   style(color=8));
      connect(J0p3_2.ThBondCon3,B11. eThBondCon1) annotation (points=[132,140;
            132,140],  style(color=8));
      connect(B11.fThBondCon1,J0p6_3. ThBondCon4) annotation (points=[132,120;
            132,120],  style(color=8));
      connect(B63.fThBondCon1,HE13. ThBondCon1) annotation (points=[-188,-96;
            -188,-96],  style(color=8));
      connect(HE13.ThBondCon2,B64. fThBondCon1) annotation (points=[-188,-76;
            -188,-76],  style(color=8));
      connect(J0p4_1.ThBondCon1,B63. eThBondCon1) annotation (points=[-130,-130;
            -188,-130; -188,-116],     style(color=8));
      connect(B64.eThBondCon1,J0p6_5. ThBondCon4) annotation (points=[-188,-56;
            -188,120; -148,120],     style(color=8));
      connect(J0p6_2.ThBondCon4,B34. eThBondCon1) annotation (points=[-88,20;
            -88,46; -6,46; -6,60; -10,60],     style(color=8));
      connect(J0p6_2.ThBondCon6,B32. eThBondCon1) annotation (points=[-72,20;
            -72,42; 4,42; 4,80; 12,80],     style(color=8));
      connect(J0p5_3.ThBondCon2,B30. eThBondCon1) annotation (points=[0,0; 0,80;
            -12,80],      style(color=8));
      connect(J0p5_3.ThBondCon4,B36. eThBondCon1) annotation (points=[20,20; 20,
            42; 8,42; 8,60; 12,60],      style(color=8));
      connect(mSe1.ThBondCon1,B60. eThBondCon1) annotation (points=[-90,-110;
            -90,-110],  style(color=8));
      connect(B42.fThBondCon1,RFV1. ThBondCon1) annotation (points=[174,54; 174,
            54],      style(color=8));
      connect(RFV1.ThBondCon2,B43. fThBondCon1) annotation (points=[174,74; 174,
            74],      style(color=8));
      connect(B49.fThBondCon1,RFV2. ThBondCon1) annotation (points=[-174,54;
            -174,54],  style(color=8));
      connect(RFV2.ThBondCon2,B48. fThBondCon1) annotation (points=[-174,74;
            -174,74],  style(color=8));
      connect(B28.fThBondCon1,BoilCondWater2. ThBondCon2) annotation (points=[190,10;
            190,10],           style(color=8));
      connect(BoilCondWater2.ThBondCon1,B29. fThBondCon1) annotation (points=[190,-10;
            190,-10],            style(color=8));
      T_air = Air1.T;
      T_steam = WaterVapor1.T;
      T_water = Water1.T;
      T_air_boundary = Air2.T;
      T_water_boundary = WaterVapor2.T;
      p_air = Air1.p;
      p_steam = WaterVapor1.p;
      p_water = Water1.p;
      p_air_boundary = Air2.p;
      p_water_boundary = WaterVapor2.p;
      Humidity = BoilCondWater1.hum1;
      Humidity_boundary = BoilCondWater2.hum1;
      Mass_frac = CF_Vapor_M/(CF_Vapor_M + CF_Air_M);
      Mass_frac_boundary = CF_BoundaryVapor_M/(CF_BoundaryVapor_M +
        CF_BoundaryAir_M);
      CF_Air_V = Air1.V;
      CF_BoundaryAir_V = Air2.V;
      CF_Air_M = Air1.M;
      CF_BoundaryAir_M = Air2.M;
      CF_Vapor_V = WaterVapor1.V;
      CF_BoundaryVapor_V = WaterVapor2.V;
      CF_Vapor_M = WaterVapor1.M;
      CF_BoundaryVapor_M = WaterVapor2.M;
      CF_Water_V = Water1.V;
      CF_Water_Exist = Water1.Exist;
      mSe1.s = 293.15 + (Tbottom - 293.15)*(1 - exp(-time));
      HE1.s = if time < SwitchTime then HE_bottom_water_lambda else 0;
      HE2.s = HE_air_vapor_lambda;
      HE3.s = HE_water_air_lambda*CF_Air_V/(CF_Vapor_V + CF_Air_V);
      HE4.s = HE_water_vapor_lambda*CF_Vapor_V/(CF_Vapor_V + CF_Air_V);
      HE5.s = HE_vapor_boundair_lambda;
      HE6.s = HE_air_boundvapor_lambda;
      HE7.s = HE_vapor_boundvapor_lambda;
      HE8.s = HE_air_boundair_lambda;
      HE9.s = HE_boundair_boundvapor_lambda;
      HE10.s = if time < SwitchTime then 0 else HE_boundair_cover_lambda;
      HE11.s = if time < SwitchTime then 0 else HE_boundvapor_cover_lambda;
      HE_bottom_boundvapor_lambda = if CF_Water_Exist then
        HE_bottom_boundvapor_lambda1 else HE_bottom_boundvapor_lambda2;
      HE12.s = if time < SwitchTime then HE_bottom_boundvapor_lambda else 0;
      HE_bottom_boundair_lambda = if CF_Water_Exist then
        HE_bottom_boundair_lambda1 else HE_bottom_boundair_lambda2;
      HE13.s = if time < SwitchTime then HE_bottom_boundair_lambda else 0;
      RFq1.s = kRF_vapor*(Mass_frac - Mass_frac_boundary);
      RFq2.s = kRF_air*(Mass_frac_boundary - Mass_frac);
      BoilCondWater1.Vgas = CF_Vapor_V + CF_Air_V;
      BoilCondWater2.Vgas = CF_BoundaryVapor_V + CF_BoundaryAir_V;
      Volume_frac = CF_Vapor_V/(CF_Vapor_V + CF_Air_V);
      Volume_frac_boundary = CF_BoundaryVapor_V/(CF_BoundaryVapor_V +
        CF_BoundaryAir_V);
      Vtot = CF_Water_V + CF_Vapor_V + CF_BoundaryVapor_V + CF_Air_V +
        CF_BoundaryAir_V;
    end PressureCooker;

    model AirBalloon "Air balloon"
      parameter Real R0(unit="kg/(m4.s)") = 1e7 "Resistance of friction";
      parameter Real I0(unit="kg/m4") = 1e7 "Inductance of inertia";
      parameter Modelica.SIunits.ThermalConductance HE_lambda=3000
        "Thermal conductance";
      parameter Real PVE_G(unit="m4.s/kg") = 1e-4
        "Pressure/volume exchange speed";
      output Modelica.SIunits.Temperature T_Bottle "Temperature of bottle";
      output Modelica.SIunits.Pressure p_Bottle "Pressure of bottle";
      output Modelica.SIunits.Volume V_Bottle "Volume of bottle";
      output Modelica.SIunits.Mass M_Bottle "Mass of bottle";
      output Modelica.SIunits.Entropy S_Bottle "Entropy of bottle";
      output Modelica.SIunits.Temperature T_Balloon "Temperature of balloon";
      output Modelica.SIunits.Pressure p_Balloon "Pressure of balloon";
      output Modelica.SIunits.Volume V_Balloon "Volume of balloon";
      output Modelica.SIunits.Mass M_Balloon "Mass of balloon";
      output Modelica.SIunits.Entropy S_Balloon "Entropy of balloon";
      annotation (
        Icon(
          Rectangle(extent=[-54,10; -42,-50], style(
              color=3,
              rgbcolor={0,0,255},
              fillPattern=10)),
          Ellipse(extent=[38,56; 62,20], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=6,
              rgbfillColor={255,255,0})),
          Rectangle(extent=[48,20; 52,16], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=6,
              rgbfillColor={255,255,0})),
          Rectangle(extent=[-50,10; -46,20], style(
              color=3,
              rgbcolor={0,0,255},
              fillColor=75,
              rgbfillColor={85,85,255},
              fillPattern=1)),
          Line(points=[-24,4; -24,-6; -4,6; -4,-6; -24,6; -24,4], style(
              color=3,
              rgbcolor={0,0,255},
              smooth=0,
              fillColor=75,
              rgbfillColor={85,85,255},
              fillPattern=1)),
          Line(points=[-14,0; -14,10], style(
              color=3,
              rgbcolor={0,0,255},
              smooth=0,
              fillColor=75,
              rgbfillColor={85,85,255},
              fillPattern=1)),
          Line(points=[-18,10; -10,10], style(
              color=3,
              rgbcolor={0,0,255},
              smooth=0,
              fillColor=75,
              rgbfillColor={85,85,255},
              fillPattern=1)),
          Line(points=[-24,0; -42,0], style(
              color=3,
              rgbcolor={0,0,255},
              smooth=0,
              fillColor=75,
              rgbfillColor={85,85,255},
              fillPattern=1)),
          Line(points=[-4,0; 50,0; 50,16], style(
              color=3,
              rgbcolor={0,0,255},
              smooth=0,
              fillColor=75,
              rgbfillColor={85,85,255},
              fillPattern=1))),
        Diagram,
        Coordsys(extent=[-100,-60; 100,60], scale=0.1),
        experiment(StopTime=25),
        experimentSetupOutput,
        Documentation(info="<html>
This model represents a bottle containing compressed air initially at a pressure of 7 bar.  At time 0, the valve is opened, and air is allowed to escape from the bottle.  That air is flowing into an air balloon. <p>

The bottle is represented by an isochoric capacitive air field, whereas the air balloon is represented by a regular capacitive air field. <p>

The ambient air is represented by an effort source. <p>

Between bottle and balloon, there is true mass flow taking place.  This is represented by a volume flow element. <p>

Finally, potential equilibration takes place between the balloon and the ambient air.  This equilibration is represented by a parallel connection of a heat exchange element and a pressure/volume exchange element. <p>

Simulate across 25 seconds and plot temperature, pressure, volume, mass, and entropy of the bottle and the balloon.
</html>"));
      Substances.Air_isochoric Bottle(
        S_int0=2501.978392,
        V_int=48.11010286e-3,
        M_int0=0.4) annotation (extent=[-70,-10; -90,10]);
      Bonds.fThermoBond B1
        annotation (extent=[-70,-10; -50,10],rotation=0);
      Passive.VF VF1(
        R=R0,
        I=I0)  annotation (extent=[-50,-20; -30,20]);
      Bonds.eThermoBond B2               annotation (extent=[-30,-10; -10,10],
          rotation=0);
      Junctions.J0p4 j0_CF2               annotation (extent=[-10,-10; 10,10]);
      Bonds.eThermoBond B3               annotation (extent=[-10,-30; 10,-10],
          rotation=270);
      Substances.Air Balloon(
        S_int(start=0.0681010184),
        V_int(start=0.0083112221e-3),
        M_int(start=0.01e-3))
        annotation (extent=[-10,-50; 10,-30], rotation=-90);
      Bonds.eThermoBond B4               annotation (extent=[10,-10; 30,10],
          rotation=180);
      Passive.HE HE1 annotation (extent=[30,-10; 50,10]);
      Bonds.fThermoBond B5
        annotation (extent=[50,-10; 70,10],  rotation=180);
      Junctions.J0p3 j0p3_1 annotation (extent=[70,-10; 90,10], rotation=-90);
      Bonds.eThermoBond B6               annotation (extent=[10,30; 30,50],
          rotation=180);
      Passive.PVE PVE1(G=PVE_G) annotation (extent=[30,30; 50,50]);
      Bonds.fThermoBond B7
        annotation (extent=[50,30; 70,50],   rotation=180);
      Bonds.fThermoBond B8
        annotation (extent=[70,-30; 90,-10], rotation=90);
      Sources.Se_Air Ambient_Air
        annotation (extent=[70,-50; 90,-30], rotation=-90);
    equation
      HE1.s = HE_lambda;
      T_Bottle = Bottle.T;
      p_Bottle = Bottle.p;
      V_Bottle = Bottle.V;
      M_Bottle = Bottle.M;
      S_Bottle = Bottle.S;
      T_Balloon = Balloon.T;
      p_Balloon = Balloon.p;
      V_Balloon = Balloon.V;
      M_Balloon = Balloon.M;
      S_Balloon = Balloon.S;
      connect(B1.eThBondCon1, Bottle.ThBondCon1) annotation (points=[-70,0; -70,
            0], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(VF1.ThBondCon1, B1.fThBondCon1) annotation (points=[-50,0; -50,0],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B2.fThBondCon1, VF1.ThBondCon2) annotation (points=[-30,0; -30,0],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(j0_CF2.ThBondCon1, B2.eThBondCon1) annotation (points=[-10,0; -10,
            0], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(j0_CF2.ThBondCon3, B3.fThBondCon1) annotation (points=[0,-10;
            1.83697e-015,-10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B3.eThBondCon1, Balloon.ThBondCon1) annotation (points=[
            -1.83697e-015,-30; -6.12323e-016,-30], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B4.eThBondCon1, j0_CF2.ThBondCon2) annotation (points=[10,
            1.22465e-015; 10,0], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(HE1.ThBondCon1, B4.fThBondCon1) annotation (points=[30,0; 30,
            -1.22465e-015], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B5.fThBondCon1, HE1.ThBondCon2) annotation (points=[50,
            1.22465e-015; 50,0], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(j0p3_1.ThBondCon3, B5.eThBondCon1) annotation (points=[70,
            -6.12323e-016; 74,-6.12323e-016; 76,-1.22465e-015; 70,-1.22465e-015],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B6.eThBondCon1, j0_CF2.ThBondCon4) annotation (points=[10,40; 0,
            40; 0,10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(PVE1.ThBondCon1, B6.fThBondCon1) annotation (points=[30,40; 30,40],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B7.fThBondCon1, PVE1.ThBondCon2) annotation (points=[50,40; 50,40],
          style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(j0p3_1.ThBondCon1, B7.eThBondCon1) annotation (points=[80,10; 80,
            40; 70,40], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(j0p3_1.ThBondCon2, B8.fThBondCon1) annotation (points=[80,-10; 80,
            -10], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
      connect(B8.eThBondCon1, Ambient_Air.ThBondCon1) annotation (points=[80,
            -30; 80,-30], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0,
          fillColor=75,
          rgbfillColor={85,85,255},
          fillPattern=1));
    end AirBalloon;

    model WaterLoop "Circular water flow through pipes"
      constant Real pi = Modelica.Constants.pi;
      parameter Real eta_H2O(unit="kg/(m.s)") = 1e-3 "Fluid viscosity";
      parameter Modelica.SIunits.Entropy Sfict = 0.2954618
        "Entropy if no water";
      parameter Modelica.SIunits.Volume Vfict = 0.99715033e-6
        "Volume if no water";
      parameter Modelica.SIunits.Mass Mfict = 1e-3 "Mass if no water";
      parameter Modelica.SIunits.Length pipe_length = 5 "Pipe segment length";
      parameter Modelica.SIunits.Length pipe_radius = 0.0127 "Pipe radius";
      final parameter Real R0(unit="kg/(m4.s)") = 8*eta_H2O*pipe_length/(pi*pipe_radius^4)
        "Resistance of pneumatic friction (Poiseuille law)";
      parameter Real I0(unit="kg/m4") = 3e5 "Inductance of pneumatic inertia";
      final parameter Modelica.SIunits.Volume V0 = pi*pipe_length*(pipe_radius^2)
        "Volume of pipe segment";
      final parameter Modelica.SIunits.Mass M0 = V0*Mfict/Vfict
        "Mass of pipe segment";
      final parameter Modelica.SIunits.Entropy S0 = V0*Sfict/Vfict
        "Entropy of pipe segment";
      parameter Real kp(unit="m3/rad") = 1e-6 "Pump constant";
      parameter Real Bm(final unit="N.m.s/rad",final min=0) = 1.6e-6
        "Mechanical friction constant";
      parameter Modelica.SIunits.Inertia Jm = 43.61e-9 "Mechanical inertia";
      parameter Real psi(unit="N.m/A") = 8.9e-3 "Back EMF constant";
      parameter Modelica.SIunits.Time PumpStartTime = 1.0;
      parameter Modelica.SIunits.Voltage Ua = 12.0 "Armature voltage";
      parameter Modelica.SIunits.Resistance Ra = 48 "Armature resistance";
      parameter Modelica.SIunits.Inductance La = 0.85e-3 "Armature inductance";
      output Modelica.SIunits.Pressure p1 "Pressure of first water storage";
      output Modelica.SIunits.Pressure p2 "Pressure of second water storage";
      output Modelica.SIunits.Pressure p3 "Pressure of third water storage";
      output Modelica.SIunits.Pressure p4 "Pressure of fourth water storage";
      output Modelica.SIunits.ThermalConductance Sdot1
        "Entropy flow through first pipe segment";
      output Modelica.SIunits.VolumeFlowRate q1
        "Volume flow through first pipe segment";
      output Modelica.SIunits.MassFlowRate Mdot1
        "Mass flow through first pipe segment";
      output Modelica.SIunits.ThermalConductance Sdot2
        "Entropy flow through second pipe segment";
      output Modelica.SIunits.VolumeFlowRate q2
        "Volume flow through second pipe segment";
      output Modelica.SIunits.MassFlowRate Mdot2
        "Mass flow through second pipe segment";
      output Modelica.SIunits.ThermalConductance Sdot3
        "Entropy flow through third pipe segment";
      output Modelica.SIunits.VolumeFlowRate q3
        "Volume flow through third pipe segment";
      output Modelica.SIunits.MassFlowRate Mdot3
        "Mass flow through third pipe segment";
      annotation (
        Coordsys(extent=[-80,-160; 180,100], scale=0.1),
        Diagram(
          Line(points=[30,-20; 30,-19.4737],   style(color=8)),
          Line(points=[30,-0.0526; 30,0],      style(color=8)),
          Line(points=[0,30; 0,30],   style(color=8)),
          Line(points=[-20,-50; -20,-50],   style(color=8)),
          Line(points=[-50,0; -50,0],   style(color=8)),
          Line(points=[-20,30; -20,30],   style(color=8)),
          Line(points=[0,-50; 0,-50],   style(color=8)),
          Line(points=[-50,-20; -50,-20],   style(color=8))),
        Icon(Line(points=[-60,-100; -40,-100; -40,38; -20,38; -20,-98; 0,-98; 0,
                38; 20,38; 20,-98; 40,-98; 40,38; 60,38; 60,-98; 80,-98; 80,38;
                100,38; 100,-98; 120,-98; 120,38; 140,38; 140,-100],
                       style(thickness=2)), Line(points=[140,-100; 160,-100],
              style(thickness=2))),
        experiment(StopTime=4),
        experimentSetupOutput,
        Documentation(info="<html>
In this example, we wish to model a closed water loop.  Such loops are used e.g. as part of thermal solar systems.  Water (or glycol) is being pumped up to the collector on the roof by a small pump that itself may be powered by a small photovoltaic panel. <p>

The model doesn't contain the solar collector (heat source and heat exchanger) yet, only the water loop and the pump.  The pump is powered by a small DC motor, a <a href=\"http://www.robotstorehk.com/1524_S.pdf\">Faulhaber S1524-012S</a> model. <p>

The pump is switched on after 1 second. <p>

Simulate across 4 seconds, and plot the pressures in the four water chambers as well as volumetric, mass, and entropy flows in the three regular pipe segments.
</html>"));
      Bonds.eThermoBond B1               annotation (extent=[20,-80; 40,-60],
          rotation=-90);
      Junctions.J0p3 J0p3_1               annotation (extent=[20,-60; 40,-40],
          rotation=-90);
      Bonds.fThermoBond B2               annotation (extent=[20,-40; 40,-20],
          rotation=90);
      Bonds.eThermoBond B3               annotation (extent=[20,0; 40,20],
          rotation=90);
      Junctions.J0p3 J0p3_2               annotation (extent=[20,20; 40,40],
          rotation=-90);
      Bonds.eThermoBond B4               annotation (extent=[20,40; 40,60],
          rotation=90);
      Passive.FVF FVF1(R=R0)         annotation (extent=[20,-30; 40,10],  rotation=
           90);
      Bonds.fThermoBond B5               annotation (extent=[0,20; 20,40],
          rotation=180);
      Passive.VF VF1(
        R=R0,
        I=I0)                      annotation (extent=[0,10; -20,50]);
      Bonds.eThermoBond B6               annotation (extent=[-40,20; -20,40],
          rotation=180);
      Junctions.J0p3 J0p3_3               annotation (extent=[-40,20; -60,40],
          rotation=-90);
      Bonds.eThermoBond B7               annotation (extent=[-60,40; -40,60],
          rotation=90);
      Bonds.fThermoBond B8               annotation (extent=[-60,0; -40,20],
          rotation=270);
      Passive.VF VF2(
        R=R0,
        I=I0)                      annotation (extent=[-40,-30; -60,10],  rotation=
           270);
      Bonds.eThermoBond B9               annotation (extent=[-60,-40; -40,-20],
          rotation=270);
      Junctions.J0p3 J0p3_4               annotation (extent=[-40,-60; -60,-40],
            rotation=-90);
      Bonds.eThermoBond B10               annotation (extent=[-60,-80; -40,-60],
            rotation=-90);
      Bonds.fThermoBond B11               annotation (extent=[-40,-60; -20,-40]);
      Passive.VF VF3(
        R=R0,
        I=I0)                      annotation (extent=[-20,-70; 0,-30]);
      Bonds.eThermoBond B12               annotation (extent=[0,-60; 20,-40]);
      BondLib.Passive.TF TF1(m=kp)
                             annotation (extent=[80,-20; 60,0]);
      BondLib.Bonds.eBond B13 annotation (extent=[40,-20; 60,0],   rotation=180);
      BondLib.Bonds.eBond B14 annotation (extent=[80,-20; 100,0],    rotation=180);
      BondLib.Junctions.J1p4 J1p4_1 annotation (extent=[100,-20; 120,0]);
      BondLib.Bonds.fBond B15 annotation (extent=[100,0; 120,20],   rotation=90);
      BondLib.Passive.I I1(I=Jm)
                           annotation (extent=[100,20; 120,40],   rotation=90);
      BondLib.Bonds.eBond B16 annotation (extent=[120,-20; 140,0]);
      BondLib.Passive.R R1(R=Bm)
                           annotation (extent=[140,-20; 160,0]);
      BondLib.Bonds.fBond B17 annotation (extent=[100,-40; 120,-20],   rotation=90);
      BondLib.Passive.GY GY1(r=psi)
                             annotation (extent=[100,-60; 120,-40],   rotation=90);
      BondLib.Bonds.eBond B18 annotation (extent=[100,-80; 120,-60],   rotation=90);
      BondLib.Junctions.J1p4 J1p4_2 annotation (extent=[100,-100; 120,-80]);
      BondLib.Bonds.fBond B19 annotation (extent=[100,-120; 120,-100],   rotation=
            90);
      BondLib.Bonds.eBond B20 annotation (extent=[120,-100; 140,-80]);
      BondLib.Passive.R R2(R=Ra)
                           annotation (extent=[140,-100; 160,-80]);
      BondLib.Bonds.fBond B21 annotation (extent=[80,-100; 100,-80],    rotation=
            180);
      BondLib.Passive.I I2(I=La)
                           annotation (extent=[60,-80; 80,-100],    rotation=180);
      BondLib.Sources.stepSe Se1(startTime=PumpStartTime, e0=Ua)
        annotation (extent=[100,-140; 120,-120],
                                              rotation=270);
      Substances.Water_isochoric Water1(
        S_int0=S0,
        V_int=V0,
        M_int0=M0) annotation (extent=[20,-100; 40,-80], rotation=-90);
      Substances.Water_isochoric Water4(
        S_int0=S0,
        V_int=V0,
        M_int0=M0) annotation (extent=[-60,-100; -40,-80], rotation=-90);
      Substances.Water_isochoric Water2(
        S_int0=S0,
        V_int=V0,
        M_int0=M0) annotation (extent=[20,60; 40,80], rotation=90);
      Substances.Water_isochoric Water3(
        S_int0=S0,
        V_int=V0,
        M_int0=M0) annotation (extent=[-60,60; -40,80], rotation=90);
    equation
      p1 = Water1.p;
      p2 = Water2.p;
      p3 = Water3.p;
      p4 = Water4.p;
      Sdot1 = VF1.Sdot1;
      q1 = VF1.q1;
      Mdot1 = VF1.Mdot1;
      Sdot2 = VF2.Sdot1;
      q2 = VF2.q1;
      Mdot2 = VF2.Mdot1;
      Sdot3 = VF3.Sdot1;
      q3 = VF3.q1;
      Mdot3 = VF3.Mdot1;
      connect(J0p3_1.ThBondCon2,B1. fThBondCon1) annotation (points=[30,-60; 30,
            -60], style(color=8));
      connect(J0p3_1.ThBondCon1,B2. eThBondCon1) annotation (points=[30,-40; 30,
            -40], style(color=8));
      connect(B3.eThBondCon1,J0p3_2. ThBondCon2) annotation (points=[30,20; 30,
            20], style(color=8));
      connect(J0p3_2.ThBondCon1,B4. fThBondCon1) annotation (points=[30,40; 30,
            40], style(color=8));
      connect(J0p3_2.ThBondCon3,B5. eThBondCon1) annotation (points=[20,30; 20,
            30], style(color=8));
      connect(B6.eThBondCon1,J0p3_3. ThBondCon3) annotation (points=[-40,30;
            -40,30],
                   style(color=8));
      connect(J0p3_3.ThBondCon1,B7. fThBondCon1) annotation (points=[-50,40;
            -50,40],
                   style(color=8));
      connect(J0p3_3.ThBondCon2,B8. eThBondCon1) annotation (points=[-50,20;
            -50,20],
                   style(color=8));
      connect(B9.eThBondCon1,J0p3_4. ThBondCon1) annotation (points=[-50,-40;
            -50,-40],
                    style(color=8));
      connect(J0p3_4.ThBondCon2,B10. fThBondCon1) annotation (points=[-50,-60;
            -50,-60],  style(color=8));
      connect(J0p3_4.ThBondCon3,B11. eThBondCon1) annotation (points=[-40,-50;
            -40,-50],  style(color=8));
      connect(B12.eThBondCon1,J0p3_1. ThBondCon3) annotation (points=[20,-50;
            20,-50],style(color=8));
      connect(FVF1.BondCon1,B13. eBondCon1) annotation (points=[40,-10; 40,-10],
            style(color=8));
      connect(B13.fBondCon1,TF1. BondCon2) annotation (points=[60,-10; 60,-10],
          style(color=8));
      connect(B14.eBondCon1,TF1. BondCon1) annotation (points=[80,-10; 80,-10],
            style(color=8));
      connect(J1p4_1.BondCon1,B14. fBondCon1) annotation (points=[100,-10; 100,
            -10], style(color=8));
      connect(J1p4_1.BondCon4,B15. eBondCon1) annotation (points=[110,0; 110,0],
            style(color=8));
      connect(B15.fBondCon1,I1. BondCon1) annotation (points=[110,20; 110,20],
          style(color=8));
      connect(J1p4_1.BondCon2,B16. fBondCon1) annotation (points=[120,-10; 120,
            -10], style(color=8));
      connect(B16.eBondCon1,R1. BondCon1) annotation (points=[140,-10; 140,-10],
            style(color=8));
      connect(B17.fBondCon1,J1p4_1. BondCon3) annotation (points=[110,-20; 110,
            -20], style(color=8));
      connect(GY1.BondCon2,B17. eBondCon1) annotation (points=[110,-40; 110,-40],
            style(color=8));
      connect(B18.eBondCon1,GY1. BondCon1) annotation (points=[110,-60; 110,-60],
            style(color=8));
      connect(J1p4_2.BondCon4,B18. fBondCon1) annotation (points=[110,-80; 110,
            -80], style(color=8));
      connect(B19.fBondCon1,J1p4_2. BondCon3) annotation (points=[110,-100; 110,
            -100], style(color=8));
      connect(J1p4_2.BondCon2,B20. fBondCon1) annotation (points=[120,-90; 120,
            -90], style(color=8));
      connect(B20.eBondCon1,R2. BondCon1) annotation (points=[140,-90; 140,-90],
            style(color=8));
      connect(J1p4_2.BondCon1,B21. eBondCon1) annotation (points=[100,-90; 100,
            -90], style(color=8));
      connect(I2.BondCon1,B21. fBondCon1) annotation (points=[80,-90; 80,-90],
            style(color=8));
      connect(B2.fThBondCon1,FVF1. ThBondCon1) annotation (points=[30,-20; 30,
            -20], style(color=8));
      connect(B3.fThBondCon1,FVF1. ThBondCon2) annotation (points=[30,0; 30,0],
                        style(color=8));
      connect(B5.fThBondCon1,VF1. ThBondCon1) annotation (points=[0,30; 0,30],
                      style(color=8));
      connect(B6.fThBondCon1,VF1. ThBondCon2) annotation (points=[-20,30; -20,
            30],      style(color=8));
      connect(B8.fThBondCon1,VF2. ThBondCon1) annotation (points=[-50,0; -50,0],
            style(color=8));
      connect(B9.fThBondCon1,VF2. ThBondCon2) annotation (points=[-50,-20; -50,
            -20], style(color=8));
      connect(B11.fThBondCon1,VF3. ThBondCon1) annotation (points=[-20,-50; -20,
            -50],      style(color=8));
      connect(B12.fThBondCon1,VF3. ThBondCon2) annotation (points=[0,-50; 0,-50],
                       style(color=8));
      connect(Se1.BondCon1, B19.eBondCon1) annotation (points=[110,-120; 110,
            -120], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B1.eThBondCon1, Water1.ThBondCon1) annotation (points=[30,-80; 30,
            -80], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(B10.eThBondCon1, Water4.ThBondCon1) annotation (points=[-50,-80;
            -50,-80], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(Water2.ThBondCon1, B4.eThBondCon1) annotation (points=[30,60; 30,
            60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
      connect(Water3.ThBondCon1, B7.eThBondCon1) annotation (points=[-50,60;
            -50,60], style(
          color=8,
          rgbcolor={192,192,192},
          smooth=0));
    end WaterLoop;
  end Examples;
end ThermoBondLib;
