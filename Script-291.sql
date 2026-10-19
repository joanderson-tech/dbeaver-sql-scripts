

DO $$
BEGIN
    IF NOT EXISTS (
        SELECT 1 
        FROM information_schema.columns 
        WHERE table_schema = 'basico'
        AND table_name = 'etapa_ensino'
        AND column_name = 'eja_especial'
    ) THEN
        ALTER TABLE basico.etapa_ensino ADD eja_especial bool DEFAULT false NOT NULL;
    END IF;
END $$;