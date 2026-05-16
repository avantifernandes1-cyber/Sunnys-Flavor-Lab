-- ══════════════════════════════════════════════════════════════
--  SUNNY'S — Supabase RLS Policies
--  Your tables are already created. Just run this to set policies.
-- ══════════════════════════════════════════════════════════════

ALTER TABLE vault       ENABLE ROW LEVEL SECURITY;
ALTER TABLE on_deck     ENABLE ROW LEVEL SECURITY;
ALTER TABLE suggestions ENABLE ROW LEVEL SECURITY;
ALTER TABLE votes       ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "vault_select_all"    ON vault;
DROP POLICY IF EXISTS "vault_insert_admin"  ON vault;
DROP POLICY IF EXISTS "vault_update_admin"  ON vault;
DROP POLICY IF EXISTS "vault_delete_admin"  ON vault;

DROP POLICY IF EXISTS "on_deck_select_all"   ON on_deck;
DROP POLICY IF EXISTS "on_deck_insert_admin" ON on_deck;
DROP POLICY IF EXISTS "on_deck_update_admin" ON on_deck;
DROP POLICY IF EXISTS "on_deck_delete_admin" ON on_deck;

DROP POLICY IF EXISTS "suggestions_insert_all"   ON suggestions;
DROP POLICY IF EXISTS "suggestions_select_admin" ON suggestions;
DROP POLICY IF EXISTS "suggestions_update_admin" ON suggestions;
DROP POLICY IF EXISTS "suggestions_delete_admin" ON suggestions;

DROP POLICY IF EXISTS "votes_insert_all"   ON votes;
DROP POLICY IF EXISTS "votes_select_all"   ON votes;
DROP POLICY IF EXISTS "votes_delete_admin" ON votes;

CREATE POLICY "vault_select_all"    ON vault FOR SELECT USING (true);
CREATE POLICY "vault_insert_admin"  ON vault FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "vault_update_admin"  ON vault FOR UPDATE USING (auth.uid() IS NOT NULL);
CREATE POLICY "vault_delete_admin"  ON vault FOR DELETE USING (auth.uid() IS NOT NULL);

CREATE POLICY "on_deck_select_all"   ON on_deck FOR SELECT USING (true);
CREATE POLICY "on_deck_insert_admin" ON on_deck FOR INSERT WITH CHECK (auth.uid() IS NOT NULL);
CREATE POLICY "on_deck_update_admin" ON on_deck FOR UPDATE USING (auth.uid() IS NOT NULL);
CREATE POLICY "on_deck_delete_admin" ON on_deck FOR DELETE USING (auth.uid() IS NOT NULL);

CREATE POLICY "suggestions_insert_all"   ON suggestions FOR INSERT WITH CHECK (true);
CREATE POLICY "suggestions_select_admin" ON suggestions FOR SELECT USING (auth.uid() IS NOT NULL);
CREATE POLICY "suggestions_update_admin" ON suggestions FOR UPDATE USING (auth.uid() IS NOT NULL);
CREATE POLICY "suggestions_delete_admin" ON suggestions FOR DELETE USING (auth.uid() IS NOT NULL);

CREATE POLICY "votes_insert_all"   ON votes FOR INSERT WITH CHECK (true);
CREATE POLICY "votes_select_all"   ON votes FOR SELECT USING (true);
CREATE POLICY "votes_delete_admin" ON votes FOR DELETE USING (auth.uid() IS NOT NULL);
