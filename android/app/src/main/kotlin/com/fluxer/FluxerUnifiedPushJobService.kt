package com.fluxer

import android.app.job.JobInfo
import android.app.job.JobParameters
import android.app.job.JobScheduler
import android.app.job.JobService
import android.content.ComponentName
import android.content.Context
import android.os.Build

class FluxerUnifiedPushJobService : JobService() {
    override fun onStartJob(params: JobParameters): Boolean =
        FluxerUnifiedPushService.attachJob(this, params)

    override fun onStopJob(params: JobParameters): Boolean {
        FluxerUnifiedPushService.detachJob(this)
        return false
    }

    companion object {
        private const val JOB_ID = 0x75706a

        fun schedule(context: Context): Boolean {
            if (Build.VERSION.SDK_INT < Build.VERSION_CODES.S) {
                return false
            }
            val scheduler = context.getSystemService(JobScheduler::class.java) ?: return false
            val job =
                JobInfo.Builder(
                    JOB_ID,
                    ComponentName(context, FluxerUnifiedPushJobService::class.java),
                ).setExpedited(true)
                    .build()
            return runCatching { scheduler.schedule(job) == JobScheduler.RESULT_SUCCESS }
                .onFailure { error ->
                    FluxerNativeMeasure.reportHandled(
                        error,
                        source = "unified_push",
                        context = "schedule expedited job",
                    )
                }.getOrDefault(false)
        }
    }
}
