import canonicalLaneMathlib.AdmissibleClass
import DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean.BackwardErrorAnalysis

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure ComparisonPackage {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    {V : VariationalErrorPackage F} {E : VariationalErrorEvidence V}
    {B : BackwardErrorPackage E} {Ev : BackwardErrorEvidence B} (C : BackwardErrorClosed B) where
  stiffOscillatorTestPassed : Prop
  orbitalDynamicsTestPassed : Prop
  longTimeEnergyDriftBound : Prop
  stiffOscillatorTestPassedClosed : stiffOscillatorTestPassed
  orbitalDynamicsTestPassedClosed : orbitalDynamicsTestPassed
  longTimeEnergyDriftBoundClosed : longTimeEnergyDriftBound

structure ComparisonEvidence {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    {V : VariationalErrorPackage F} {E : VariationalErrorEvidence V}
    {B : BackwardErrorPackage E} {Ev : BackwardErrorEvidence B}
    {C : BackwardErrorClosed B} (Cp : ComparisonPackage C) where
  stiffOscillatorTestPassedClosed : Cp.stiffOscillatorTestPassed
  orbitalDynamicsTestPassedClosed : Cp.orbitalDynamicsTestPassed
  longTimeEnergyDriftBoundClosed : Cp.longTimeEnergyDriftBound

def ComparisonClosed {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    {V : VariationalErrorPackage F} {E : VariationalErrorEvidence V}
    {B : BackwardErrorPackage E} {Ev : BackwardErrorEvidence B}
    {C : BackwardErrorClosed B} (Cp : ComparisonPackage C) : Prop :=
  Cp.stiffOscillatorTestPassed ∧ Cp.orbitalDynamicsTestPassed ∧ Cp.longTimeEnergyDriftBound

theorem comparison_closed_from_evidence {P : SymplecticIntegratorPackage} {F : SymplecticIntegratorEvidence P}
    {V : VariationalErrorPackage F} {E : VariationalErrorEvidence V}
    {B : BackwardErrorPackage E} {Ev : BackwardErrorEvidence B}
    {C : BackwardErrorClosed B} (Cp : ComparisonPackage C) (Cpe : ComparisonEvidence Cp) :
    ComparisonClosed Cp := by
  exact And.intro Cpe.stiffOscillatorTestPassedClosed
    (And.intro Cpe.orbitalDynamicsTestPassedClosed Cpe.longTimeEnergyDriftBoundClosed)

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
