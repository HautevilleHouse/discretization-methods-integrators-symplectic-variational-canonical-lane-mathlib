import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean

open HautevilleHouse.CanonicalLaneMathlibCore

structure SymplecticEndgameState where
  object : AdmittedObject

def symplecticProjection : Projection SymplecticEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem symplectic_projection_idempotent (x : SymplecticEndgameState) :
    symplecticProjection.toFun (symplecticProjection.toFun x) = symplecticProjection.toFun x := by
  exact symplecticProjection.idempotent x

end DiscretizationMethodsIntegratorsSymplecticVariationalCanonicalLaneLean
end HautevilleHouse
