import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

structure DiscretizationAdmittedObject where
  phaseSpace : Type u
  symplecticForm : Type v
  integratorStep : Type w
  stepConservesSymplecticForm : Prop
  conclusion : stepConservesSymplecticForm

structure AdmissibleClass where
  object : DiscretizationAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  DiscretizationWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
