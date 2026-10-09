-- Behavior for "Captain" (mod ID 3729910023).
-- The metatable name "Captain" must match LuaMetatableName on CD_Captain.
-- Override hooks declared on RivalsLuaCharacterEntity to customize behavior;
-- defaults come from C++. Call self:Super_<Name>(...) to inherit base behavior.

Captain = Class(RivalsLuaCharacterEntity)

-- =========================================================================
-- Core gameplay hooks
-- =========================================================================

-- Ticks once per-frame before movement tick.
-- function Captain:GameplayTick()
--     self:Super_GameplayTick()
-- end

-- Drives the per-frame attack/window pipeline. Runs only while in the Attack state.
-- Return false to signal the rest of this frame's attack work should be skipped
-- function Captain:UpdateAttack()
--     return self:Super_UpdateAttack()
-- end

-- Fired when one of this character's hitboxes hits a character. 
-- function Captain:OnHitRival(OtherRival, Hitbox) end

-- Called on (re)spawn. Reset character-specific state here.
-- function Captain:ResetCharacterProperties()
--     self:Super_ResetCharacterProperties()
-- end

-- Runs once when the character enters a new state (Attack, AirDodge, Roll, etc.).
-- function Captain:InitState(OriginalNewState, bIsPivoting)
--     self:Super_InitState(OriginalNewState, bIsPivoting)
-- end

-- Cleanup hook fired when an in-progress attack is cut short (state change, hit, grab break).
-- Override to tear down character-specific attack state.
-- function Captain:InterruptAttack(AttackInterrupted)
--     self:Super_InterruptAttack(AttackInterrupted)
-- end

-- Runs after this character's hitbox has confirmed-hit on a target, once damage/knockback is resolved.
-- Use to apply character-specific status effects.
-- AttackArmored is true if the target ate the hit with armor.
-- function Captain:ApplyHitboxEffect(Target, HitboxEffect, Hitbox, AttackArmored) end

-- Gate for character-specific window-cancel rules (e.g. cancel-on-hit windows).
-- Return true to permit the cancel for the given WindowCancelType.
-- function Captain:ShouldPerformCharacterSpecificCancel(WindowCancelType)
--     return self:Super_ShouldPerformCharacterSpecificCancel(WindowCancelType)
-- end

-- Refills air-based resources: double jumps, airdodge, wall-cling, walljump
-- count, glide-toss count, platdrop/auto-fastfall timers. With bTouchedGround,
-- also clears the per-airtime attack-count and ledgegrab lockout. Returns true
-- if real ground was touched (false for things like kragg pillar).
-- function Captain:RestoreAllResources(bTouchedGround)
--     return self:Super_RestoreAllResources(bTouchedGround)
-- end

-- =========================================================================
-- CPU AI hooks (overridden by every shipped character)
-- =========================================================================

-- Returns this attack's effective reach as an FBox2d in character-local space
-- (positive X is forward). The CPU uses it to decide whether a target is in range before swinging.
-- function Captain:GetCpuAttackRange(InAttack)
--     return self:Super_GetCpuAttackRange(InAttack)
-- end

-- Returns the list of recovery moves the CPU may try from a given off-stage
-- position, as a sol::table of ERivalsCharacterAttack. Lua overrides the *Table
-- form (the non-Table TArray form isn't lua-bindable here).
-- function Captain:GetCpuRecoveryOptionsTable(VecToLedgeLocation, WallXPos, WallMinHeight, LedgeOccupied)
--     return self:Super_GetCpuRecoveryOptionsTable(VecToLedgeLocation, WallXPos, WallMinHeight, LedgeOccupied)
-- end

-- Sets CPU stick/button state for the recovery phase. Base zeros all buttons,
-- then calls UpdateCpuInputsRecoveryBasic for an auto-recovery jump+special;
-- override to plug in your own recovery routine (multi-jumps, tether, etc.).
-- function Captain:UpdateCpuInputsRecovery()
--     self:Super_UpdateCpuInputsRecovery()
-- end

-- Sets CPU stick/button state while an attack is already executing — e.g. jab
-- cancel choices, charge-strong release timing, B-reverse inputs. Target may be
-- nil if there's no current target.
-- function Captain:UpdateCpuInputsAttacking(Target)
--     self:Super_UpdateCpuInputsAttacking(Target)
-- end
